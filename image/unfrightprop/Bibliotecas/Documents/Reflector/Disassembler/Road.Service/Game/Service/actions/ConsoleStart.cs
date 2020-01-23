namespace Game.Service.actions
{
    using Bussiness;
    using Bussiness.Managers;
    using Game.Base;
    using Game.Logic;
    using Game.Server;
    using Game.Server.GameObjects;
    using Game.Server.Managers;
    using Game.Server.Packets;
    using Game.Server.Rooms;
    using Game.Service;
    using log4net;
    using Road.Service;
    using SqlDataProvider.Data;
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Runtime.CompilerServices;
    using System.Runtime.InteropServices;
    using System.Threading;
    using System.Timers;
    using System.Windows.Forms;
    using System.Xml;

    public class ConsoleStart : Game.Service.IAction
    {
        private static int _count;
        private static System.Threading.Timer _timer;
        private static ConsoleClient client = null;
        private static ConsoleCtrlDelegate handler;
        private static readonly ILog log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        private static int ConsoleCtrHandler(ConsoleEvent e)
        {
            SetConsoleCtrlHandler(handler, false);
            if (GameServer.Instance != null)
            {
                GameServer.Instance.Stop();
            }
            return 0;
        }

        public static void DoCommand(string CommandName, string[] CommandArgs)
        {
            PlayerBussiness bussiness;
            PlayerInfo userSingleByNickName;
            Exception exception;
            string str3;
            string str4;
            string str5;
            ManageBussiness bussiness2;
            switch (CommandName)
            {
                case "exit":
                    GameServer.KeepRunning = false;
                    break;

                case "cp":
                {
                    GameClient[] allClients = GameServer.Instance.GetAllClients();
                    int num = (allClients == null) ? 0 : allClients.Length;
                    GamePlayer[] allPlayers = WorldMgr.GetAllPlayers();
                    int num2 = (allPlayers == null) ? 0 : allPlayers.Length;
                    List<BaseRoom> allUsingRoom = RoomMgr.GetAllUsingRoom();
                    int num3 = 0;
                    int num4 = 0;
                    foreach (BaseRoom room in allUsingRoom)
                    {
                        if (!room.IsEmpty)
                        {
                            num3++;
                            if (room.IsPlaying)
                            {
                                num4++;
                            }
                        }
                    }
                    double totalMemory = GC.GetTotalMemory(false);
                    Console.WriteLine(string.Format("Total Clients/Players:{0}/{1}", num, num2));
                    Console.WriteLine(string.Format("Total Rooms/Games:{0}/{1}", num3, num4));
                    Console.WriteLine(string.Format("Total Momey Used:{0} MB", (totalMemory / 1024.0) / 1024.0));
                    break;
                }
                case "setlevel":
                    try
                    {
                        string path = Path.Combine(Environment.CurrentDirectory, "LevelList.xml");
                        if (!File.Exists(path))
                        {
                            log.Error("LevelList.xml not found!");
                        }
                        else
                        {
                            int num6;
                            Console.Write("Please enter the level: ");
                            string s = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                            if (!int.TryParse(s, out num6))
                            {
                                log.Error("Level is not valid int!");
                            }
                            else
                            {
                                using (bussiness = new PlayerBussiness())
                                {
                                    userSingleByNickName = bussiness.GetUserSingleByNickName((CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine());
                                    if (userSingleByNickName == null)
                                    {
                                        log.Error(string.Format("Player not found in db!", new object[0]));
                                        break;
                                    }
                                    if (!IsValidGZip(File.ReadAllBytes(path)))
                                    {
                                        log.Error("LevelList.xml is not valid!");
                                    }
                                    else if (!IsValidXML(GZip.gzuncompress(File.ReadAllBytes(path))))
                                    {
                                        log.Error("LevelList.xml is not valid!");
                                    }
                                    if (WorldMgr.GetPlayerById(userSingleByNickName.ID) != null)
                                    {
                                        WorldMgr.GetPlayerById(userSingleByNickName.ID).SaveIntoDatabase();
                                        WorldMgr.GetPlayerById(userSingleByNickName.ID).Disconnect();
                                    }
                                    XmlDocument document = new XmlDocument();
                                    document.LoadXml(GZip.gzuncompress(File.ReadAllBytes(path)));
                                    int num7 = -1;
                                    int num8 = -1;
                                    foreach (XmlNode node in document.SelectNodes("/Result/*"))
                                    {
                                        if (node.Attributes["Grade"].Value == s)
                                        {
                                            num7 = int.Parse(s);
                                            num8 = int.Parse(node.Attributes["GP"].Value) + 5;
                                            break;
                                        }
                                    }
                                    if ((num7 != -1) && (num8 != -1))
                                    {
                                        userSingleByNickName.GP = num8;
                                        userSingleByNickName.Grade = num7;
                                        bussiness.UpdatePlayer(userSingleByNickName);
                                        log.Info(string.Format("Player {0} updated successfully!", userSingleByNickName.NickName));
                                    }
                                    else
                                    {
                                        log.Error(string.Format("Level {0} not found!", new object[0]));
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception exception1)
                    {
                        exception = exception1;
                        log.Error("There was an error in command!");
                        log.Error(exception.Message + Environment.NewLine + exception.StackTrace);
                    }
                    break;

                case "addmoney":
                    try
                    {
                        using (bussiness = new PlayerBussiness())
                        {
                            userSingleByNickName = bussiness.GetUserSingleByNickName((CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine());
                            if (userSingleByNickName != null)
                            {
                                if (WorldMgr.GetPlayerById(userSingleByNickName.ID) != null)
                                {
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).SaveIntoDatabase();
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).Disconnect();
                                }
                                Console.Write("Please enter the amount of money: ");
                                str3 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                                if (!IsValidInt(str3))
                                {
                                    log.Error("Money is not valid!");
                                }
                                else
                                {
                                    userSingleByNickName.Money += int.Parse(str3);
                                    bussiness.UpdatePlayer(userSingleByNickName);
                                    log.Info(string.Format("Player {0} updated successfully!", userSingleByNickName.NickName));
                                }
                            }
                            else
                            {
                                log.Error(string.Format("Player not found in db!", new object[0]));
                            }
                        }
                    }
                    catch (Exception exception3)
                    {
                        exception = exception3;
                        log.Error("There was an error in command!");
                        log.Error(exception.Message + Environment.NewLine + exception.StackTrace);
                    }
                    break;

                case "addgold":
                    try
                    {
                        using (bussiness = new PlayerBussiness())
                        {
                            userSingleByNickName = bussiness.GetUserSingleByNickName((CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine());
                            if (userSingleByNickName != null)
                            {
                                if (WorldMgr.GetPlayerById(userSingleByNickName.ID) != null)
                                {
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).SaveIntoDatabase();
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).Disconnect();
                                }
                                Console.Write("Please enter the amount of gold: ");
                                str4 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                                if (!IsValidInt(str4))
                                {
                                    log.Error("Gold is not valid!");
                                }
                                else
                                {
                                    userSingleByNickName.Gold += int.Parse(str4);
                                    bussiness.UpdatePlayer(userSingleByNickName);
                                    log.Info(string.Format("Player {0} updated successfully!", userSingleByNickName.NickName));
                                }
                            }
                            else
                            {
                                log.Error(string.Format("Player not found in db!", new object[0]));
                            }
                        }
                    }
                    catch (Exception exception4)
                    {
                        exception = exception4;
                        log.Error("There was an error in command!");
                        log.Error(exception.Message + Environment.NewLine + exception.StackTrace);
                    }
                    break;

                case "addgift":
                    try
                    {
                        using (bussiness = new PlayerBussiness())
                        {
                            userSingleByNickName = bussiness.GetUserSingleByNickName((CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine());
                            if (userSingleByNickName != null)
                            {
                                Console.Write("Please enter the amount of gift token: ");
                                str5 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                                if (!IsValidInt(str5))
                                {
                                    log.Error("Gold is not valid!");
                                }
                                else
                                {
                                    if (WorldMgr.GetPlayerById(userSingleByNickName.ID) != null)
                                    {
                                        WorldMgr.GetPlayerById(userSingleByNickName.ID).SaveIntoDatabase();
                                        WorldMgr.GetPlayerById(userSingleByNickName.ID).Disconnect();
                                    }
                                    userSingleByNickName.GiftToken += int.Parse(str5);
                                    bussiness.UpdatePlayer(userSingleByNickName);
                                    log.Info(string.Format("Player {0} updated successfully!", userSingleByNickName.NickName));
                                }
                            }
                            else
                            {
                                log.Error(string.Format("Player not found in db!", new object[0]));
                            }
                        }
                    }
                    catch (Exception exception5)
                    {
                        exception = exception5;
                        log.Error("There was an error in command!");
                        log.Error(exception.Message + Environment.NewLine + exception.StackTrace);
                    }
                    break;

                case "removemoney":
                    try
                    {
                        using (bussiness = new PlayerBussiness())
                        {
                            userSingleByNickName = bussiness.GetUserSingleByNickName((CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine());
                            if (userSingleByNickName != null)
                            {
                                if (WorldMgr.GetPlayerById(userSingleByNickName.ID) != null)
                                {
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).SaveIntoDatabase();
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).Disconnect();
                                }
                                Console.Write("Please enter the amount of money: ");
                                str3 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                                if (!IsValidInt(str3))
                                {
                                    log.Error("Money is not valid!");
                                }
                                else
                                {
                                    userSingleByNickName.Money -= int.Parse(str3);
                                    bussiness.UpdatePlayer(userSingleByNickName);
                                    log.Info(string.Format("Player {0} updated successfully!", userSingleByNickName.NickName));
                                }
                            }
                            else
                            {
                                log.Error(string.Format("Player not found in db!", new object[0]));
                            }
                        }
                    }
                    catch (Exception exception6)
                    {
                        exception = exception6;
                        log.Error("There was an error in command!");
                        log.Error(exception.Message + Environment.NewLine + exception.StackTrace);
                    }
                    break;

                case "removegold":
                    try
                    {
                        using (bussiness = new PlayerBussiness())
                        {
                            userSingleByNickName = bussiness.GetUserSingleByNickName((CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine());
                            if (userSingleByNickName != null)
                            {
                                if (WorldMgr.GetPlayerById(userSingleByNickName.ID) != null)
                                {
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).SaveIntoDatabase();
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).Disconnect();
                                }
                                Console.Write("Please enter the amount of gold: ");
                                str4 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                                if (!IsValidInt(str4))
                                {
                                    log.Error("Gold is not valid!");
                                }
                                else
                                {
                                    userSingleByNickName.Gold -= int.Parse(str4);
                                    bussiness.UpdatePlayer(userSingleByNickName);
                                    log.Info(string.Format("Player {0} updated successfully!", userSingleByNickName.NickName));
                                }
                            }
                            else
                            {
                                log.Error(string.Format("Player not found in db!", new object[0]));
                            }
                        }
                    }
                    catch (Exception exception7)
                    {
                        exception = exception7;
                        log.Error("There was an error in command!");
                        log.Error(exception.Message + Environment.NewLine + exception.StackTrace);
                    }
                    break;

                case "removegift":
                    try
                    {
                        using (bussiness = new PlayerBussiness())
                        {
                            userSingleByNickName = bussiness.GetUserSingleByNickName((CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine());
                            if (userSingleByNickName != null)
                            {
                                if (WorldMgr.GetPlayerById(userSingleByNickName.ID) != null)
                                {
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).SaveIntoDatabase();
                                    WorldMgr.GetPlayerById(userSingleByNickName.ID).Disconnect();
                                }
                                Console.Write("Please enter the amount of gift token: ");
                                str5 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                                if (!IsValidInt(str5))
                                {
                                    log.Error("Gold is not valid!");
                                }
                                else
                                {
                                    userSingleByNickName.GiftToken -= int.Parse(str5);
                                    bussiness.UpdatePlayer(userSingleByNickName);
                                    log.Info(string.Format("Player {0} updated successfully!", userSingleByNickName.NickName));
                                }
                            }
                            else
                            {
                                log.Error(string.Format("Player not found in db!", new object[0]));
                            }
                        }
                    }
                    catch (Exception exception8)
                    {
                        exception = exception8;
                        log.Error("There was an error in command!");
                        log.Error(exception.Message + Environment.NewLine + exception.StackTrace);
                    }
                    break;

                case "shutdown":
                    _count = 6;
                    _timer = new System.Threading.Timer(new TimerCallback(ConsoleStart.ShutDownCallBack), null, 0, 0xea60);
                    break;

                case "addcps":
                    try
                    {
                        Console.Write("Insira o valor dos Cupons:");
                        int num9 = int.Parse((CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine());
                        foreach (GamePlayer player in WorldMgr.GetAllPlayers())
                        {
                            player.AddMoney(num9);
                            player.SendMessage("Parab\x00e9ns, voc\x00ea recebeu " + num9 + " cupons do evento, bom jogo !");
                        }
                    }
                    catch (Exception exception9)
                    {
                        exception = exception9;
                        log.Error("Error on AddCps", exception);
                    }
                    break;

                case "bnick":
                {
                    Console.Clear();
                    Console.WriteLine("Digite o NickName do personagem: ");
                    string nickName = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                    Console.WriteLine("Motivo para banir: ");
                    string msg = (CommandArgs.Length > 1) ? CommandArgs[1] : Console.ReadLine();
                    DateTime date = new DateTime(0x7e1, 7, 2);
                    using (bussiness2 = new ManageBussiness())
                    {
                        bussiness2.ForbidPlayerByNickName(nickName, date, false);
                        bussiness2.KitoffUserByNickName(nickName, msg);
                    }
                    Console.WriteLine("O Usu\x00e1rio " + nickName + " Foi Banido do servidor.");
                    foreach (GamePlayer player2 in WorldMgr.GetAllPlayers())
                    {
                        player2.SendMessage("O Usu\x00e1rio " + nickName + " foi banido do servidor, motivo do BAN: " + msg + ".");
                    }
                    break;
                }
                case "buser":
                {
                    Console.Clear();
                    Console.WriteLine("Digite o UserName do personagem: ");
                    string userName = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                    Console.WriteLine("Motivo para banir: ");
                    string str9 = (CommandArgs.Length > 1) ? CommandArgs[1] : Console.ReadLine();
                    DateTime time2 = new DateTime(0x7e1, 7, 2);
                    using (bussiness2 = new ManageBussiness())
                    {
                        bussiness2.ForbidPlayerByUserName(userName, time2, false);
                        bussiness2.KitoffUserByUserName(userName, str9);
                    }
                    Console.WriteLine("O Usu\x00e1rio " + userName + " Foi Banido do servidor.");
                    foreach (GamePlayer player2 in WorldMgr.GetAllPlayers())
                    {
                        player2.SendMessage("O Usu\x00e1rio " + userName + " foi banido do servidor, motivo do BAN: " + str9 + ".");
                    }
                    break;
                }
                case "nkick":
                {
                    Console.Clear();
                    Console.WriteLine("Digite o NickName do personagem: ");
                    string name = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                    Console.WriteLine("Motivo para kikar: ");
                    string str11 = (CommandArgs.Length > 1) ? CommandArgs[1] : Console.ReadLine();
                    using (bussiness2 = new ManageBussiness())
                    {
                        bussiness2.KitoffUserByNickName(name, str11);
                    }
                    foreach (GamePlayer player2 in WorldMgr.GetAllPlayers())
                    {
                        player2.SendMessage("O Usu\x00e1rio " + name + " foi kikado do servidor, motivo do KICK: " + str11 + ".");
                    }
                    break;
                }
                case "ukick":
                {
                    Console.Clear();
                    Console.WriteLine("Digite o NickName do personagem: ");
                    string str12 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                    Console.WriteLine("Motivo para kikar: ");
                    string str13 = (CommandArgs.Length > 1) ? CommandArgs[1] : Console.ReadLine();
                    using (bussiness2 = new ManageBussiness())
                    {
                        bussiness2.KitoffUserByUserName(str12, str13);
                    }
                    foreach (GamePlayer player2 in WorldMgr.GetAllPlayers())
                    {
                        player2.SendMessage("O Usu\x00e1rio " + str12 + " foi kikado do servidor, motivo do KICK: " + str13 + ".");
                    }
                    break;
                }
                case "maint":
                    try
                    {
                        int num10;
                        Console.Write("Enter time in minutes to start maintenance: ");
                        string str14 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                        if (!int.TryParse(str14, out num10))
                        {
                            log.Error("Invalid MainTime!");
                        }
                        else
                        {
                            new Thread(delegate (object mt) {
                                if (mt is string)
                                {
                                    Action<string, string> Sys = delegate (string nick, string Text) {
                                        Console.WriteLine(Text);
                                        foreach (GamePlayer player in WorldMgr.GetAllPlayers())
                                        {
                                            player.SendMessage(string.Format("[{0}] {1}", nick, Text));
                                        }
                                    };
                                    Action DisconnectAll = delegate {
                                        foreach (GamePlayer player in WorldMgr.GetAllPlayers())
                                        {
                                            log.Info(string.Format("Saving Player {0} into Database!", player.PlayerCharacter.NickName));
                                            player.SaveIntoDatabase();
                                            log.Info(string.Format("Disconnecting Player {0}!", player.PlayerCharacter.NickName));
                                            player.Disconnect();
                                        }
                                        log.Info("Shutdown Server!");
                                        GameServer.Instance.Shutdown();
                                        LogManager.Shutdown();
                                    };
                                    Sys("Auto Maintenance", "Manuten\x00e7\x00e3o agendada, fiquem atentos aos aviso!");
                                    System.Timers.Timer MainTimer = new System.Timers.Timer {
                                        Interval = 1000.0
                                    };
                                    DateTime MainTime = DateTime.Parse(string.Format("{0} 00:00:00", "01/27/2011"), CultureInfo.GetCultureInfo("en-US"));
                                    MainTime = MainTime.AddMinutes(double.Parse(mt as string));
                                    string CurrentTime = MainTime.ToString("HH:mm:ss");
                                    MainTimer.Elapsed += delegate (object s, ElapsedEventArgs e) {
                                        if (CurrentTime != "00:00:00")
                                        {
                                            if ((MainTime.Minute != 0) && (MainTime.Second == 0))
                                            {
                                                Sys("Auto Maintenance", string.Format("Falta {0} {1} para a manuten\x00e7\x00e3o!", MainTime.Minute, (MainTime.Minute == 1) ? "Minuto" : "Minutos"));
                                            }
                                            else if (MainTime.Second < 11)
                                            {
                                                Sys("Auto Maintenance", string.Format("Fechando o servidor em {0}", MainTime.Second));
                                            }
                                            CurrentTime = MainTime.AddSeconds(-1.0).ToString("HH:mm:ss");
                                        }
                                        else
                                        {
                                            Sys("Auto Maintenance", "Estamos desconectando todos os usu\x00e1rios para a manuten\x00e7\x00e3o, voltamos daqui a alguns minutos, saiam do servidor para evitar perca de itens!");
                                            log.Info("End!");
                                            DisconnectAll();
                                            MainTimer.Stop();
                                        }
                                    };
                                    MainTimer.Start();
                                }
                            }).Start(str14);
                        }
                    }
                    catch (Exception exception10)
                    {
                        exception = exception10;
                        log.Error("There was an error in command!");
                        log.Error(exception.Message + Environment.NewLine + exception.StackTrace);
                    }
                    break;

                case "savemap":
                    break;

                case "clear":
                    Console.Clear();
                    break;

                case "ball&reload":
                    if (BallMgr.ReLoad())
                    {
                        Console.WriteLine("Ball info is Reload!");
                    }
                    else
                    {
                        Console.WriteLine("Ball info is Error!");
                    }
                    break;

                case "map&reload":
                    if (!MapMgr.ReLoadMap())
                    {
                        Console.WriteLine("Map info is Error!");
                        break;
                    }
                    Console.WriteLine("Map info is Reload!");
                    break;

                case "mapserver&reload":
                    if (!MapMgr.ReLoadMapServer())
                    {
                        Console.WriteLine("mapserver info is Error!");
                        break;
                    }
                    Console.WriteLine("mapserver info is Reload!");
                    break;

                case "prop&reload":
                    if (!PropItemMgr.Reload())
                    {
                        Console.WriteLine("prop info is Error!");
                        break;
                    }
                    Console.WriteLine("prop info is Reload!");
                    break;

                case "item&reload":
                    if (!ItemMgr.ReLoad())
                    {
                        Console.WriteLine("item info is Error!");
                        break;
                    }
                    Console.WriteLine("item info is Reload!");
                    break;

                case "shop&reload":
                    if (!ShopMgr.ReLoad())
                    {
                        Console.WriteLine("shop info is Error!");
                        break;
                    }
                    Console.WriteLine("shop info is Reload!");
                    break;

                case "quest&reload":
                    if (!QuestMgr.ReLoad())
                    {
                        Console.WriteLine("quest info is Error!");
                        break;
                    }
                    Console.WriteLine("quest info is Reload!");
                    break;

                case "fusion&reload":
                    if (!FusionMgr.ReLoad())
                    {
                        Console.WriteLine("fusion info is Error!");
                        break;
                    }
                    Console.WriteLine("fusion info is Reload!");
                    break;

                case "consortia&reload":
                    if (!ConsortiaMgr.ReLoad())
                    {
                        Console.WriteLine("consortiaMgr info is Error!");
                        break;
                    }
                    Console.WriteLine("consortiaMgr info is Reload!");
                    break;

                case "rate&reload":
                    if (!RateMgr.ReLoad())
                    {
                        Console.WriteLine("Rate Rate is Error!");
                        break;
                    }
                    Console.WriteLine("Rate Rate is Reload!");
                    break;

                case "fight&reload":
                    if (!FightRateMgr.ReLoad())
                    {
                        Console.WriteLine("FightRateMgr is Error!");
                        break;
                    }
                    Console.WriteLine("FightRateMgr is Reload!");
                    break;

                case "dailyaward&reload":
                    if (!AwardMgr.ReLoad())
                    {
                        Console.WriteLine("dailyaward is Error!");
                        break;
                    }
                    Console.WriteLine("dailyaward is Reload!");
                    break;

                case "language&reload":
                    if (!LanguageMgr.Reload(""))
                    {
                        Console.WriteLine("language is Error!");
                        break;
                    }
                    Console.WriteLine("language is Reload!");
                    break;

                case "treasure&reload":
                    if (!TreasureAwardMgr.ReLoad())
                    {
                        Console.WriteLine("TreasureAward is Error!");
                        break;
                    }
                    Console.WriteLine("TreasureAward is Reload!");
                    break;

                case "nickname":
                {
                    Console.WriteLine("Please enter the nickname");
                    string str15 = (CommandArgs.Length > 0) ? CommandArgs[0] : Console.ReadLine();
                    Console.WriteLine(WorldMgr.GetPlayerStringByPlayerNickName(str15));
                    break;
                }
                default:
                {
                    string cmdLine = CommandName + string.Join(" ", CommandArgs);
                    if (cmdLine.Length > 0)
                    {
                        if (cmdLine[0] == '/')
                        {
                            cmdLine = cmdLine.Remove(0, 1).Insert(0, "&");
                        }
                        try
                        {
                            if (!CommandMgr.HandleCommandNoPlvl(client, cmdLine))
                            {
                                Console.WriteLine("Unknown command: " + cmdLine);
                            }
                        }
                        catch (Exception exception2)
                        {
                            Console.WriteLine(exception2.ToString());
                        }
                    }
                    break;
                }
            }
        }

        public static void FindPlayer(out PlayerInfo Player)
        {
            Player = null;
            Console.Write("Please enter the find type(0 = UserName, 1 = NickName, 2 = ID): ");
            string str = Console.ReadLine();
            if ((!IsValidInt(str) || (int.Parse(str) < 0)) || (int.Parse(str) > 2))
            {
                log.Error("Invalid Find Type!");
                Player = null;
            }
            else
            {
                string userName = "null";
                int userID = -1;
                if (str == "0")
                {
                    Console.Write("Please enter the username: ");
                    userName = Console.ReadLine();
                }
                else if (str == "1")
                {
                    Console.Write("Please enter the nickname: ");
                    userName = Console.ReadLine();
                }
                else if (str == "2")
                {
                    Console.Write("Please enter the UserID: ");
                    string str3 = Console.ReadLine();
                    if (!IsValidInt(str3))
                    {
                        log.Error("Invalid UserID!");
                        Player = null;
                    }
                    else
                    {
                        userID = int.Parse(str3);
                    }
                }
                using (PlayerBussiness bussiness = new PlayerBussiness())
                {
                    switch (str)
                    {
                        case "0":
                            Player = bussiness.GetUserSingleByUserName(userName);
                            return;

                        case "1":
                            Player = bussiness.GetUserSingleByNickName(userName);
                            return;
                    }
                    if (str == "2")
                    {
                        Player = bussiness.GetUserSingleByUserID(userID);
                        if (Player != null)
                        {
                            userName = Player.NickName;
                        }
                    }
                }
            }
        }

        public static bool IsValidGZip(byte[] Data)
        {
            try
            {
                GZip.gzuncompress(Data);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsValidInt(object Value)
        {
            try
            {
                int.Parse(Value.ToString());
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsValidXML(string Text)
        {
            try
            {
                new XmlDocument().LoadXml(Text);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void OnAction(Hashtable parameters)
        {
            Console.Title = "Build by Thiago Hajjar";
            Console.WriteLine("Starting GameServer ... Edit by Thiago Hajjar!");
            GameServer.CreateInstance(new GameServerConfig());
            GameServer.Instance.Start();
            GameServer.KeepRunning = true;
            Console.WriteLine("Server started!");
            client = new ConsoleClient();
            Thread thread = new Thread(() => Application.Run(new CommandForm()));
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            while (GameServer.KeepRunning)
            {
                try
                {
                    handler = new ConsoleCtrlDelegate(ConsoleStart.ConsoleCtrHandler);
                    SetConsoleCtrlHandler(handler, true);
                    Console.Write("> ");
                    string[] source = Console.ReadLine().Split(new char[] { ' ' });
                    List<string> list = source.ToList<string>();
                    list.RemoveAt(0);
                    DoCommand(source[0], list.ToArray());
                }
                catch (Exception exception)
                {
                    Console.WriteLine(exception);
                }
            }
            if (GameServer.Instance != null)
            {
                GameServer.Instance.Stop();
            }
            LogManager.Shutdown();
        }

        [DllImport("kernel32.dll", CallingConvention=CallingConvention.StdCall)]
        private static extern int SetConsoleCtrlHandler(ConsoleCtrlDelegate HandlerRoutine, bool add);
        private static void ShutDownCallBack(object state)
        {
            _count--;
            Console.WriteLine(string.Format("Server will shutdown after {0} mins!", _count));
            GameClient[] allClients = GameServer.Instance.GetAllClients();
            foreach (GameClient client in allClients)
            {
                if (client.Out != null)
                {
                    client.Out.SendMessage(eMessageType.Normal, string.Format("{0}{1}{2}", LanguageMgr.GetTranslation("Game.Service.actions.ShutDown1", new object[0]), _count, LanguageMgr.GetTranslation("Game.Service.actions.ShutDown2", new object[0])));
                }
            }
            if (_count == 0)
            {
                _timer.Dispose();
                _timer = null;
                GameServer.Instance.Stop();
                Console.WriteLine("Server has stopped!");
            }
        }

        public string Description
        {
            get
            {
                return "Starts the DOL server in console mode";
            }
        }

        public string Name
        {
            get
            {
                return "--start";
            }
        }

        public string Syntax
        {
            get
            {
                return "--start [-config=./config/serverconfig.xml]";
            }
        }

        private delegate int ConsoleCtrlDelegate(ConsoleStart.ConsoleEvent ctrlType);

        private enum ConsoleEvent
        {
            Ctrl_C,
            Ctrl_Break,
            Close,
            Logoff,
            Shutdown
        }
    }
}


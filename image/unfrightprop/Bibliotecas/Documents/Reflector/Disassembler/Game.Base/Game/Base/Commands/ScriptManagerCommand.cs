namespace Game.Base.Commands
{
    using Game.Base;
    using Game.Server.Managers;
    using System;
    using System.IO;
    using System.Reflection;

    [Cmd("&sm", ePrivLevel.Player, "Script Manager console commands.", new string[] { "   /sm  <option>  [para1][para2]...", "eg: /sm -list              : List all assemblies in scripts array.", "    /sm -add <assembly>    : Add assembly into the scripts array.", "    /sm -remove <assembly> : Remove assembly from the scripts array." })]
    public class ScriptManagerCommand : AbstractCommandHandler, ICommandHandler
    {
        public bool OnCommand(BaseClient client, string[] args)
        {
            if (args.Length <= 1)
            {
                this.DisplaySyntax(client);
                return true;
            }
            switch (args[1])
            {
                case "-list":
                    foreach (Assembly assembly in ScriptMgr.Scripts)
                    {
                        this.DisplayMessage(client, assembly.FullName);
                    }
                    return true;

                case "-add":
                    if (((args.Length > 2) && (args[2] != null)) && File.Exists(args[2]))
                    {
                        try
                        {
                            if (ScriptMgr.InsertAssembly(Assembly.LoadFile(args[2])))
                            {
                                this.DisplayMessage(client, "Add assembly success!");
                                return true;
                            }
                            this.DisplayMessage(client, "Assembly already exists in the scripts array!");
                            return false;
                        }
                        catch (Exception exception)
                        {
                            this.DisplayMessage(client, "Add assembly error:", new object[] { exception.Message });
                            return false;
                        }
                    }
                    this.DisplayMessage(client, "Can't find add assembly!");
                    return false;

                case "-remove":
                    if (((args.Length > 2) && (args[2] != null)) && File.Exists(args[2]))
                    {
                        try
                        {
                            if (ScriptMgr.RemoveAssembly(Assembly.LoadFile(args[2])))
                            {
                                this.DisplayMessage(client, "Remove assembly success!");
                                return true;
                            }
                            this.DisplayMessage(client, "Assembly didn't exist in the scripts array!");
                            return false;
                        }
                        catch (Exception exception2)
                        {
                            this.DisplayMessage(client, "Remove assembly error:", new object[] { exception2.Message });
                            return false;
                        }
                    }
                    this.DisplayMessage(client, "Can't find remove assembly!");
                    return false;
            }
            this.DisplayMessage(client, "Can't fine option:{0}", new object[] { args[1] });
            return true;
        }
    }
}


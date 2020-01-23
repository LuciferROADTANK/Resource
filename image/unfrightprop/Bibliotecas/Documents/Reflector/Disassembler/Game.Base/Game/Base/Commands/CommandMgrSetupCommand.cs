namespace Game.Base.Commands
{
    using Game.Base;
    using System;

    [Cmd("&cmd", ePrivLevel.Admin, "Config the command system.", new string[] { "/cmd [option] <para1> <para2>      ", "eg: /cmd -reload           :Reload the command system.", "    /cmd -list             :Display all commands." })]
    public class CommandMgrSetupCommand : AbstractCommandHandler, ICommandHandler
    {
        public bool OnCommand(BaseClient client, string[] args)
        {
            if (args.Length <= 1)
            {
                this.DisplaySyntax(client);
            }
            else
            {
                string str = args[1];
                if (str != null)
                {
                    if (!(str == "-reload"))
                    {
                        if (str == "-list")
                        {
                            CommandMgr.DisplaySyntax(client);
                            goto Label_0049;
                        }
                    }
                    else
                    {
                        CommandMgr.LoadCommands();
                        goto Label_0049;
                    }
                }
                this.DisplaySyntax(client);
            }
        Label_0049:
            return true;
        }
    }
}


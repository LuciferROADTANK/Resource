namespace Game.Base.Commands
{
    using Game.Base;
    using Game.Server.Managers;
    using System;

    [Cmd("&cs", ePrivLevel.Player, "Compile the C# scripts.", new string[] { "/cs  <source file> <target> <importlib>", "eg: /cs ./scripts temp.dll game.base.dll,game.logic.dll" })]
    public class BuildScriptCommand : AbstractCommandHandler, ICommandHandler
    {
        public bool OnCommand(BaseClient client, string[] args)
        {
            if (args.Length >= 4)
            {
                string path = args[1];
                string dllName = args[2];
                string str3 = args[3];
                ScriptMgr.CompileScripts(false, path, dllName, str3.Split(new char[] { ',' }));
            }
            else
            {
                this.DisplaySyntax(client);
            }
            return true;
        }
    }
}


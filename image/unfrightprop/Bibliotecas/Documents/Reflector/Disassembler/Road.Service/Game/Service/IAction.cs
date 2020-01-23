namespace Game.Service
{
    using System;
    using System.Collections;

    internal interface IAction
    {
        void OnAction(Hashtable parameters);

        string Description { get; }

        string Name { get; }

        string Syntax { get; }
    }
}


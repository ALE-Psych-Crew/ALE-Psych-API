package;

import dox.*;

import haxe.rtti.CType.TypeInfos;

import sys.FileSystem;
import sys.io.Process;
import sys.io.File;

import haxe.io.Path;

using StringTools;

class DocsGenerator
{
	static function getProcessOutput(cmd:String, ?args:Array<String>):String
    {
		try
        {
			final process = new Process(cmd, args);

			var output = '';

			try
            {
				output = process.stdout.readAll().toString();
			} catch (_) {}

			process.close();

			return output;
		} catch (e) {
			trace('[ERROR] ' + e.message);

			return '';
		}
	}

    public static function main()
    {
        final config:Config = new Config(Path.removeTrailingSlashes(getProcessOutput('haxelib libpath dox').trim()));
		config.inputPath = 'ALE-Psych/docs.xml';
		config.pageTitle = 'ALE Psych API';
		config.outputPath = 'docs/';
		config.loadTheme('default');

		Dox.run(config, Api.new);
    }
}
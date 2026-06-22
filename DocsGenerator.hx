package;

import dox.*;

import haxe.rtti.CType.TypeInfos;

import dox.Config.Define;

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
		config.loadTheme('themes/ale-psych');

		config.defines.set(Define.ThemeColor, '0xB986FF');
		config.defines.set(Define.TextColor, '0xF4F7FF');
		config.defines.set(Define.Website, 'https://github.com/ALE-Psych-Crew/ALE-Psych');
		config.defines.set(Define.Description, 'API documentation for ALE Psych.');
		config.defines.set(Define.SourcePath, 'https://github.com/ALE-Psych-Crew/ALE-Psych/blob/main/source/');

		Dox.run(config, Api.new);
    }
}

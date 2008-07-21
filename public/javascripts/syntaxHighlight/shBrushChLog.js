/**
 *  Author: Lisowski Rafał
 *  created: 2008-06-28
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, version 3 of the License.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

dp.sh.Brushes.Log = function()
{
    var builtins =  '[(0-9)*] - beta beta-. alpha alpha-. stable stable-.';
    
    var keywords =  'itscantbeempty';
                  
    var exclude =  'itscantbeempty';

    this.regexList = [
                    /* cometarios */
                    {regex: dp.sh.RegexLib.SingleLinePerlComments, css: 'comment'},
                    /* cadenas de texto */
                    {regex: dp.sh.RegexLib.DoubleQuotedString, css: 'string'},
                    {regex: dp.sh.RegexLib.SingleQuotedString, css: 'string'},
                    /* delimitadores */
                    {regex: new RegExp('[()[\\]{}]', 'g'), css: 'delim'},
                    /* variables */
                    {regex: new RegExp('\\$\\w+', 'g'), css: 'vars'},
                    {regex: new RegExp('\\w+=', 'g'), css: 'vars'},
                    /* banderas */
                    {regex: new RegExp('\\s-\\w+', 'g'), css: 'flag'},
                    /* headers */
                    {regex: new RegExp('==[a-zA-Z0-9 ]*==', 'g'), css: 'header'},
                    /* builtins */
                    {regex: new RegExp(this.GetKeywords(builtins), 'gm'), css: 'builtin'},
                    {regex: new RegExp(this.GetKeywords(keywords), 'gm'), css: 'keyword'},
                    {regex: new RegExp(this.GetKeywords(exclude), 'gm'), css: 'normal'}
                    /* palabras reservadas */
                    /*{regex: new RegExp(this.GetKeywords_without(keywords, '='), 'gm'), css: 'keyword'}*/
                    ];

    this.CssClass = 'dp-bash';

    this.Style =    '.dp-bash .builtin {color: maroon; font-weight: bold;}' +
                    '.dp-bash .comment {color: gray;}' +
                    '.dp-bash .delim {font-weight: bold;}' +
                    '.dp-bash .flag {color: green;}' +
                    '.dp-bash .string {color: red;}' +
                    '.dp-bash .vars {color: blue;}' +
                    '.dp-bash .header {color: black;font-weight: bold;}' +
                    '.dp-bash .normal';

}

dp.sh.Brushes.Log.prototype = new dp.sh.Highlighter();
dp.sh.Brushes.Log.Aliases = ['chlog', 'todo', 'changelog'];

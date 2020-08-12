MD5DEEP(1)                  United States Air Force                 MD5DEEP(1)



NAME
       md5deep - Compute MD5 message digests
       sha1deep - Compute SHA-1 message digests
       sha256deep - Compute SHA-256 message digests
       tigerdeep - Computer Tiger message digests
       whirlpooldeep - Compute Whirlpool message digests


SYNOPSIS
       md5deep -v | -V | -h
       md5deep  [-m|-M|-x|-X  <file>]   [-a|-A <hash>] [-nwzres0lbk] [-o <fbc-
       plsd>] [FILES]


DESCRIPTION
       Computes the hashes, or message digest, for any number of  files  while
       optionally  recursively  digging  through the directory structure.  Can
       also take a list of known hashes and display  the  filenames  of  input
       files  whose  hashes either do or do not match any of the known hashes.
       Errors are reported to standard error. If no FILES are specified, reads
       from standard input.


       -r     Enables recursive mode. All subdirectories are traversed. Please
              note that recursive mode cannot be used to examine all files  of
              a  given  file  extension. For example, calling md5deep -r *.txt
              will examine all files in directories that end in .txt.


       -e     Displays a progress indicator and estimate of time remaining for
              each  file being processed. Time estimates for files larger than
              4GB are not available on Windows.


       -m <file>
              Enables matching mode. The file given should be a list of  known
              hashes.   The  input  files are examined one at a time, and only
              those files that match the list of known hashes are output. This
              flag  may  be  used more than once to add multiple sets of known
              hashes. Acceptable formats for lists of known hashes  are  plain
              (such  as  those  generated  by  md5deep  or md5sum), Hashkeeper
              files, iLook, and the National Software Reference Library (NSRL)
              as  produced by the National Institute for Standards in Technol-
              ogy.

              If standard input is used with the -m flag, displays "stdin"  if
              the input matches one of the hashes in the list of known hashes.
              If the hash does not match, the program displays no output.

              This flag may not be used in conjunction with the -x, -X, or  -A
              flags.


       -x <file>
              Same  as the -m flag above, but does negative matching. That is,
              only those files NOT in the list of known hashes are  displayed.

              This  flag may not be used in conjunction with the -m, -M, or -a
              flags.


       -M and -X <file>
              Same as -m and -x above, but displays the  hash  for  each  file
              that does (or does not) match the list of known hashes.


       -a <hash>
              Adds a single hash to the list of known hashes used for matching
              mode, and if not already enabled, enables matching mode.  Adding
              single  hashes cannot, by itself, be used to print the hashes of
              matching files like the -M flag does. When used  in  conjunction
              with  the  -w flag, the filename displayed is just the hash sub-
              mitted on the command line.

              This flag may not be used in conjunction with the -x, -X, or  -A
              flags.


       -A <hash>
              Same as -a above, but does negative matching.  This flag may not
              be used in conjunction with the -m, -M, or -A flags.


       -w     During any of the matching modes (-m,-M,-x,or -X), displays  the
              filename of the known hash that matched the input file.


       -n     During any of the matching modes (-m,-M,-x,or -X), displays only
              the filenames of any known hashes that were not matched  by  any
              of the input files.


       -s     Enables silent mode. All error messages are supressed.


       -z     Enables  file size mode. Prepends the hash with a ten digit rep-
              resentation of the size of each file processed. If the file size
              is  greater than 9999999999 bytes (about 9.3GB) the program dis-
              plays 9999999999 for the size.


       -0     Uses a NULL character (/0) to terminate each line instead  of  a
              newline.   Useful  for processing filenames with strange charac-
              ters.


       -l     Enables relative file paths. Instead of  printing  the  absolute
              path for each file, displays the relative file path as indicated
              on the command line. This flag may not be  used  in  conjunction
              with the -b flag.


       -b     Enables bare mode. Strips any leading directory information from
              displayed filenames.

              This flag may not be used in conjunction with the -l flag.


       -k     Enables asterisk mode. An asterisk is inserted in lieu of a sec-
              ond space between the filename and the hash, just like md5sum in
              its binary (-b) mode.


       -o <bcpflsd>
              Enables expert mode. Allows the user  specify  which  (and  only
              which)  types  of  files  are processed. Directory processing is
              still controlled with the  -r  flag.  The  expert  mode  options
              allowed are:
              f - Regular files
              b - Block Devices
              c - Character Devices
              p - Named Pipes
              l - Symbolic Links
              s - Sockets
              d - Solaris Doors


       -h     Show a help screen and exit.


       -v     Show the version number and exit.


       -V     Show copyright information and exit.


RETURN VALUE
       Returns  a bit-wise value based on the success of the operation and the
       status of any matching operations.


       0      Success. Note that the program considers itself successful  even
              when  it  encounters  read  errors, permission denied errors, or
              finds directories when not in recursive mode.

       1      Unused hashes. Under any of the  matching  modes,  returns  this
              value  if one or more of the known hashes was not matched by any
              of the input files.

       2      Unmatched inputs. Under any of the matching modes, returns  this
              value  if  one  or more of the input values did not match any of
              the known hashes.

       64     User error, such as trying to  do  both  positive  and  negative
              matching at the same time.

       128    Internal  error,  such  as  memory corruption or uncaught cycle.
              All internal errors should be reported to the developer! See the
              section "Reporting Bugs" below.



AUTHOR
       md5deep was written by Jesse Kornblum, md5deep [at] jessekornblum [dot]
       com.


KNOWN ISSUES
       The Windows version is not able to process files with  Unicode  charac-
       ters in their filenames.

       Using  the -r flag cannot be used to recursively process all files of a
       given extension in a directory. This is a feature, not a bug.   If  you
       need to do this, use the find(1) command.


REPORTING BUGS
       We  take  all  bug reports very seriously. Any bug that jeopardizes the
       forensic integrity of this program could have serious  consequenses  on
       people's lives. When submitting a bug report, please include a descrip-
       tion of the problem, how you found it, and your contact information.

       Send bug reports to: md5deep [at] jessekornblum [dot] com



COPYRIGHT
       This program is a work of the US Government. In accordance with 17  USC
       105,  copyright protection is not available for any work of the US Gov-
       ernment.  Lawyer to English translation: This program is PUBLIC DOMAIN.
       Not  only is this program not copyrighted, but IT CANNOT BE COPYRIGHTED
       BY ANYBODY AT ANY TIME UNDER ANY CIRCUMSTANCES.

       There is NO warranty for this program; not even for MERCHANTABILITY  or
       FITNESS FOR A PARTICULAR PURPOSE.


SEE ALSO
       More  information  and  installation  instructions  can be found in the
       README file. Current versions of both documents can  be  found  on  the
       project homepage: http://md5deep.sourceforge.net/

       The MD5 specification, RFC 1321, is available at
       http://www.ietf.org/rfc/rfc1321.txt

       The SHA-1 specification, RFC 3174, is available at
       http://www.faqs.org/rfcs/rfc3174.html

       The SHA-256 specification, FIPS 180-2, is available at
       http://csrc.nist.gov/publications/fips/fips180-2/fips180-2.pdf

       The Tiger specification is available at
       http://www.cs.technion.ac.il/~biham/Reports/Tiger/

       The Whirlpool specification is available at
       http://planeta.terra.com.br/informatica/paulobarreto/WhirlpoolPage.html



AFOSI                          v1.9 - 7 Nov 2005                    MD5DEEP(1)

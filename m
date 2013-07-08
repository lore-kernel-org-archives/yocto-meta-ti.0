Return-Path: <prvs=89431a64b=Christopher.Pow@honeywell.com>
Received: from de08ip008.honeywell.com (de08ip008.honeywell.com [199.61.24.27])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEEBEE013EC
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2013 10:40:38 -0700 (PDT)
Received-SPF: Neutral (de08ip008.honeywell.com: domain of
	Christopher.Pow@honeywell.com does not assert whether or not
	10.216.34.43 is permitted sender) identity=mailfrom;
	client-ip=10.216.34.43; receiver=de08ip008.honeywell.com;
	envelope-from="Christopher.Pow@honeywell.com";
	x-sender="Christopher.Pow@honeywell.com";
	x-conformance=spf_only; x-record-type="v=spf1"
Received-SPF: None (de08ip008.honeywell.com: no sender
	authenticity information available from domain of
	postmaster@de08ex5004.global.ds.honeywell.com) identity=helo;
	client-ip=10.216.34.43; receiver=de08ip008.honeywell.com;
	envelope-from="Christopher.Pow@honeywell.com";
	x-sender="postmaster@de08ex5004.global.ds.honeywell.com";
	x-conformance=spf_only
X-SBRS: None
X-SenderGroup: Relay_to_Internet
X-MailFlowPolicy: $Relay
X-Attachment_Filename: 
X-Attachment_Filesize: None
X-IronPort-AV: E=Sophos;i="4.87,1021,1363158000"; 
	d="scan'208,217";a="21802198"
Received: from unknown (HELO de08ex5004.global.ds.honeywell.com)
	([10.216.34.43])
	by de08ip008.honeywell.com with ESMTP; 08 Jul 2013 10:40:37 -0700
Received: from DE08EX3002.global.ds.honeywell.com ([169.254.2.139]) by
	de08ex5004.global.ds.honeywell.com ([10.216.14.77]) with mapi id
	14.02.0309.002; Mon, 8 Jul 2013 13:40:36 -0400
From: "Pow, Christopher (SWCOE)" <Christopher.Pow@honeywell.com>
To: "Frazer, Will" <will.frazer@eurotech.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] booting 2.6.32 kernel and rootfs
Thread-Index: AQHOfAAbNQjRi/uMIUiCHfF9wkg435lbCv4A
Date: Mon, 8 Jul 2013 17:40:35 +0000
Message-ID: <7B8A37CE7777314D9B931CDD3BA8C83B1BA155D2@de08ex3002.global.ds.honeywell.com>
References: <CAGX3a9_Ykh8bUQEb3KVFah+rpHck=2V8bsjVS2yyy3_RAWhamA@mail.gmail.com>
	<68f4dfd4107847b8b02ec486eff4e492@AMXPR05MB085.eurprd05.prod.outlook.com>
In-Reply-To: <68f4dfd4107847b8b02ec486eff4e492@AMXPR05MB085.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.167.150.119]
MIME-Version: 1.0
X-CFilter-Loop: Forwarded
Subject: Re: booting 2.6.32 kernel and rootfs
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 17:40:39 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7B8A37CE7777314D9B931CDD3BA8C83B1BA155D2de08ex3002globa_"

--_000_7B8A37CE7777314D9B931CDD3BA8C83B1BA155D2de08ex3002globa_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

A handy trick I found useful if you have a way to warm-reset the board [ie.=
 RAM content is unaffected]:

In the kernel source directory, type:

grep printk_buf System.map

Then warm-reset your board after it stops outputting, and in u-boot dump th=
e memory at whatever the address is that was reported as printk_buf symbol.

In my situation, integrating Linux onto a mach-davinci derived custom board=
, I found a printk message indicating it was hung waiting for something tha=
t was on the devkit but not on our board.

Christopher S. Pow
Senior Engineer, Systems
Honeywell SWCOE - RTOS
o:612-951-5852 c:612-910-1271

"The number you have dialed is imaginary.  Please rotate your phone 90 degr=
ees and try again."

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Frazer, Will
Sent: Monday, July 08, 2013 12:24 PM
To: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] booting 2.6.32 kernel and rootfs

Sounds like it is booting OK but the console is wrong.

Check into why you are getting this message also
** Unable to read "uEnv.txt" from mmc 0:1 **
as the kernel args ought to get read from there:

If they are not loaded then the defaults in the kernel will get used. You m=
ight want to check these also.
Not sure about your board/setup however try using /dev/ttyO0. You can test =
this from U-Boot also by altering the env vars

From: meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoproject.=
org> [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Sudhangathan B =
S
Sent: 06 July 2013 05:16
To: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
Subject: [meta-ti] booting 2.6.32 kernel and rootfs

On my way to integrate Leopard imaging camera drivers into the beagle board=
 image, I successfully built a minimal image with necessary camera drivers =
in the image, this is all after I integrated meta-ti layer with yocto.
I finally put the files in the card and powered up the beagle board.

This is what i'm getting..

U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 05 2013 - 20:38:26)

OMAP36XX/37XX-GP ES1.2, CPU-OPP2, L3-165MHz, Max CPU Clock 1 Ghz
OMAP3 Beagle board + LPDDR/NAND
I2C:   ready
DRAM:  512 MiB
WARNING: Caches not enabled
NAND:  0 MiB
MMC:   OMAP SD/MMC: 0
*** Warning - readenv() failed, using default environment

In:    serial
Out:   serial
Err:   serial
Beagle xM Rev C
No EEPROM on expansion board
No EEPROM on expansion board
Die ID #689000029ff80000016842c81202f014
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0
The user button is currently NOT pressed.
SD/MMC found on device 0
reading uEnv.txt

** Unable to read "uEnv.txt" from mmc 0:1 **
Loading file "/boot/uImage" from mmc device 0:2 (xxa2)
3148568 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 80200000 ...
   Image Name:   Linux-2.6.32
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3148504 Bytes =3D 3 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux........................................................=
...........................................................................=
......................................................................... d=
one, booting the kernel.

AND NOTHING AFTER THIS... Any clue how to proceed..?

I posted in this mailing list, just because i'm using the meta-ti layer. Pl=
ease do let me know if there is another one..!

Best,
---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------

--_000_7B8A37CE7777314D9B931CDD3BA8C83B1BA155D2de08ex3002globa_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">A handy trick I found use=
ful if you have a way to warm-reset the board [ie. RAM content is unaffecte=
d]:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">In the kernel source dire=
ctory, type:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">grep printk_buf System.ma=
p<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Then warm-reset your boar=
d after it stops outputting, and in u-boot dump the memory at whatever the =
address is that was reported as printk_buf symbol.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">In my situation, integrat=
ing Linux onto a mach-davinci derived custom board, I found a printk messag=
e indicating it was hung waiting for something that was
 on the devkit but not on our board.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;;color:#1F497D">Christopher S. Pow<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;;color:#1F497D">Senior Engineer, Systems<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;;color:#1F497D">Honeywell SWCOE - RTOS<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cou=
rier New&quot;;color:#1F497D">o:612-951-5852 c:612-910-1271<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cal=
ibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Cal=
ibri&quot;,&quot;sans-serif&quot;;color:#1F497D">&quot;The number you have =
dialed is imaginary.&nbsp; Please rotate your phone 90 degrees and try agai=
n.&quot;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ti-=
bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org]
<b>On Behalf Of </b>Frazer, Will<br>
<b>Sent:</b> Monday, July 08, 2013 12:24 PM<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] booting 2.6.32 kernel and rootfs<o:p></o:p></=
span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Sounds lik=
e it is booting OK but the console is wrong.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp=
;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Check into=
 why you are getting this message also
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">** Unable to read &quot;uEnv.tx=
t&quot; from mmc 0:1 **<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">as the ker=
nel args ought to get read from there:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">If they ar=
e not loaded then the defaults in the kernel will get used. You might want =
to check these also.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Not sure a=
bout your board/setup however try using /dev/ttyO0. You can test this from =
U-Boot also by altering the env vars<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp=
;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:meta-ti-bounces@yoctoproject.org">meta-ti-bounces@yoctopr=
oject.org</a> [<a href=3D"mailto:meta-ti-bounces@yoctoproject.org">mailto:m=
eta-ti-bounces@yoctoproject.org</a>]
<b>On Behalf Of </b>Sudhangathan B S<br>
<b>Sent:</b> 06 July 2013 05:16<br>
<b>To:</b> <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject=
.org</a><br>
<b>Subject:</b> [meta-ti] booting 2.6.32 kernel and rootfs<o:p></o:p></span=
></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">On my way to integrate Leopard =
imaging camera drivers into the beagle board image, I successfully built a =
minimal image with necessary camera drivers in the image, this is all after=
 I integrated meta-ti layer with yocto.<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I finally put the files in the =
card and powered up the beagle board.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">This is what i'm getting..<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">U-Boot SPL 2011.09-01172-gfdbe8=
b9-dirty (Jul 05 2013 - 20:38:26)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Texas Instruments Revision dete=
ction unimplemented<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">OMAP SD/MMC: 0<o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">reading u-boot.img<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">reading u-boot.img<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">U-Boot 2011.09-01172-gfdbe8b9-d=
irty (Jul 05 2013 - 20:38:26)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">OMAP36XX/37XX-GP ES1.2, CPU-OPP=
2, L3-165MHz, Max CPU Clock 1 Ghz<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">OMAP3 Beagle board &#43; LPDDR/=
NAND<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I2C: &nbsp; ready<o:p></o:p></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">DRAM: &nbsp;512 MiB<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">WARNING: Caches not enabled<o:p=
></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">NAND: &nbsp;0 MiB<o:p></o:p></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">MMC: &nbsp; OMAP SD/MMC: 0<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">*** Warning - readenv() failed,=
 using default environment<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">In: &nbsp; &nbsp;serial<o:p></o=
:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Out: &nbsp; serial<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Err: &nbsp; serial<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Beagle xM Rev C<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">No EEPROM on expansion board<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">No EEPROM on expansion board<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Die ID #689000029ff80000016842c=
81202f014<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Net: &nbsp; Net Initialization =
Skipped<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">No ethernet found.<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Hit any key to stop autoboot: &=
nbsp;0&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">The user button is currently NO=
T pressed.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">SD/MMC found on device 0<o:p></=
o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">reading uEnv.txt<o:p></o:p></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">** Unable to read &quot;uEnv.tx=
t&quot; from mmc 0:1 **<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Loading file &quot;/boot/uImage=
&quot; from mmc device 0:2 (xxa2)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">3148568 bytes read<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Booting from mmc ...<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">## Booting kernel from Legacy I=
mage at 80200000 ...<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; &nbsp;Image Name: &nbsp;=
 Linux-2.6.32<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; &nbsp;Image Type: &nbsp;=
 ARM Linux Kernel Image (uncompressed)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; &nbsp;Data Size: &nbsp; =
&nbsp;3148504 Bytes =3D 3 MiB<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; &nbsp;Load Address: 8000=
8000<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; &nbsp;Entry Point: &nbsp=
;80008000<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; &nbsp;Verifying Checksum=
 ... OK<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; &nbsp;Loading Kernel Ima=
ge ... OK<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">OK<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Starting kernel ...<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Uncompressing Linux............=
...........................................................................=
...........................................................................=
..........................................
 done, booting the kernel.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">AND NOTHING AFTER THIS... Any c=
lue how to proceed..?&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I posted in this mailing list, =
just because i'm using the meta-ti layer. Please do let me know if there is=
 another one..!<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Best,<br clear=3D"all">
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">-------------------------------=
--<br>
Sudhangathan BS<br>
Ph:(&#43;91) 9731-905-205<br>
---------------------------------<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_7B8A37CE7777314D9B931CDD3BA8C83B1BA155D2de08ex3002globa_--

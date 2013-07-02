Return-Path: <will.frazer@eurotech.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0184.outbound.messaging.microsoft.com [213.199.154.184])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA536E013B0
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 09:10:34 -0700 (PDT)
Received: from mail209-db8-R.bigfish.com (10.174.8.252) by
	DB8EHSOBE029.bigfish.com (10.174.4.92) with Microsoft SMTP Server id
	14.1.225.23; Tue, 2 Jul 2013 16:10:33 +0000
Received: from mail209-db8 (localhost [127.0.0.1])	by
	mail209-db8-R.bigfish.com (Postfix) with ESMTP id 3BA3420235;
	Tue,  2 Jul 2013 16:10:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:157.56.248.53; KIP:(null); UIP:(null); IPV:NLI;
	H:AMSPRD0510HT002.eurprd05.prod.outlook.com; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: PS-2(zz98dI9371Ic85fh1432I4015Izz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hz8dhz1d7338h17326ah18c673h1954cbh8275bh8275dhz2dh2a8h668h839hd24hf0ah1288h12a5h12bdh137ah1441h1504h1537h153bh162dh1631h1758h18e1h1946h19b5h19ceh1ad9h1b0ah1bceh1d07h1d0ch1d2eh1d3fh1de9h1dfeh1dffh1e1dh9a9j1155h)
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(377454003)(164054003)(189002)(51704005)(199002)(24454002)(47736001)(77096001)(80022001)(47446002)(83072001)(50986001)(81542001)(15202345003)(81342001)(69226001)(4396001)(53806001)(16236675002)(63696002)(74876001)(76576001)(47976001)(54356001)(74706001)(59766001)(49866001)(76796001)(66066001)(56776001)(77982001)(65816001)(76786001)(74316001)(19300405004)(54316002)(79102001)(16601075003)(33646001)(74366001)(16406001)(1411001)(76482001)(31966008)(46102001)(51856001)(56816003)(74662001)(74502001)(24736002);
	DIR:OUT; SFP:; SCL:1; SRVR:AMSPR05MB084;
	H:AMSPR05MB083.eurprd05.prod.outlook.com; RD:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received: from mail209-db8 (localhost.localdomain [127.0.0.1]) by mail209-db8
	(MessageSwitch) id 1372781430280513_24167;
	Tue,  2 Jul 2013 16:10:30 +0000 (UTC)
Received: from DB8EHSMHS022.bigfish.com (unknown [10.174.8.249])	by
	mail209-db8.bigfish.com (Postfix) with ESMTP id 404B9480044;
	Tue,  2 Jul 2013 16:10:30 +0000 (UTC)
Received: from AMSPRD0510HT002.eurprd05.prod.outlook.com (157.56.248.53) by
	DB8EHSMHS022.bigfish.com (10.174.4.32) with Microsoft SMTP Server (TLS)
	id 14.16.227.3; Tue, 2 Jul 2013 16:10:29 +0000
Received: from AMSPR05MB084.eurprd05.prod.outlook.com (10.242.89.152) by
	AMSPRD0510HT002.eurprd05.prod.outlook.com (10.255.42.37) with Microsoft
	SMTP Server (TLS) id 14.16.324.0; Tue, 2 Jul 2013 16:10:29 +0000
Received: from AMSPR05MB083.eurprd05.prod.outlook.com (10.242.89.149) by
	AMSPR05MB084.eurprd05.prod.outlook.com (10.242.89.152) with Microsoft
	SMTP Server (TLS) id 15.0.702.21; Tue, 2 Jul 2013 16:10:28 +0000
Received: from AMSPR05MB083.eurprd05.prod.outlook.com ([169.254.10.138]) by
	AMSPR05MB083.eurprd05.prod.outlook.com ([169.254.10.138]) with mapi id
	15.00.0702.005; Tue, 2 Jul 2013 16:10:28 +0000
From: "Frazer, Will" <will.frazer@eurotech.com>
To: Sudhangathan B S <sudhangathan@gmail.com>
Thread-Topic: [meta-ti] server outage?
Thread-Index: Ac53LWctc656SFiGSwC8veKPkU02GAAAtdCAAAImmQAAAWqvMA==
Date: Tue, 2 Jul 2013 16:10:27 +0000
Message-ID: <76f685e794254135a6a986ae31c68377@AMSPR05MB083.eurprd05.prod.outlook.com>
References: <9c193827a41e4fe7b6d03c630beb4baa@AMSPR05MB083.eurprd05.prod.outlook.com>
	<20130702142712.GD4941@edge>
	<CAGX3a9_Mhe5V2hLVs5+jFcnro9YMWPtGniVAmcG=B+b6RP7gLg@mail.gmail.com>
In-Reply-To: <CAGX3a9_Mhe5V2hLVs5+jFcnro9YMWPtGniVAmcG=B+b6RP7gLg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [164.40.222.34]
x-forefront-prvs: 0895DF8FFD
MIME-Version: 1.0
X-OriginatorOrg: eurotech.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: server outage?
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
X-List-Received-Date: Tue, 02 Jul 2013 16:10:37 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_76f685e794254135a6a986ae31c68377AMSPR05MB083eurprd05pro_"

--_000_76f685e794254135a6a986ae31c68377AMSPR05MB083eurprd05pro_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It was both however they are both OK now.

Thanks,
Will

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Sudhangathan B S
Sent: 02 July 2013 16:29
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] server outage?

Frazer probably meant the arago server, which in case it does not work, we =
get the error while parsing, from the boot-monitor_git.bb<http://boot-monit=
or_git.bb>..

Now it seems to work.. It wasn't a while ago..!

Thanks.

---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------

On Tue, Jul 2, 2013 at 7:57 PM, Denys Dmytriyenko <denys@ti.com<mailto:deny=
s@ti.com>> wrote:
On Tue, Jul 02, 2013 at 02:08:02PM +0000, Frazer, Will wrote:
> Hi guys,
>       Could someone check the servers please (meta-ti etc).
>
> Looks like they maybe down at the moment.
Seems to work for me:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/

--
Denys
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti


--_000_76f685e794254135a6a986ae31c68377AMSPR05MB083eurprd05pro_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
span.hoenzb
	{mso-style-name:hoenzb;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">It was both however they =
are both OK now.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Thanks,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Will
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span =
lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&qu=
ot;sans-serif&quot;"> meta-ti-bounces@yoctoproject.org [mailto:meta-ti-boun=
ces@yoctoproject.org]
<b>On Behalf Of </b>Sudhangathan B S<br>
<b>Sent:</b> 02 July 2013 16:29<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] server outage?<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Frazer probably meant the arago server, which in cas=
e it does not work, we get the error while parsing, from the
<a href=3D"http://boot-monitor_git.bb">boot-monitor_git.bb</a>..&nbsp;<o:p>=
</o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Now it seems to work.. It wasn't a while ago..!<o:p>=
</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">---------------------------------<br>
Sudhangathan BS<br>
Ph:(&#43;91) 9731-905-205<br>
---------------------------------<o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Tue, Jul 2, 2013 at 7:57 PM, Denys Dmytriyenko &l=
t;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; wr=
ote:<o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On Tue, Jul 02, 2013 =
at 02:08:02PM &#43;0000, Frazer, Will wrote:<br>
&gt; Hi guys,<br>
&gt; &nbsp; &nbsp; &nbsp; Could someone check the servers please (meta-ti e=
tc).<br>
&gt;<br>
&gt; Looks like they maybe down at the moment.<o:p></o:p></p>
</div>
<p class=3D"MsoNormal">Seems to work for me:<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/" target=3D"_b=
lank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/</a><br>
<span style=3D"color:#888888"><br>
<span class=3D"hoenzb">--</span><br>
<span class=3D"hoenzb">Denys</span></span><o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal">_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><o:p></o:p></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_76f685e794254135a6a986ae31c68377AMSPR05MB083eurprd05pro_--

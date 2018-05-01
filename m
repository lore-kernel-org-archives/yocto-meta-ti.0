Return-Path: <kirk.sutherland@apisensor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D201E00AE6; Tue,  1 May 2018 07:22:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.36.133 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0133.outbound.protection.outlook.com [104.47.36.133])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E858DE007C2
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2018 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=apitreck.onmicrosoft.com; s=selector1-apisensor-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=a+uw6EX41j3L+PEbYmm/Rol/qjFFnvqFatbFPIpCsO4=;
	b=ixFTyB0UilQOreLccG2nIUUW4X7qvkkUWbA0GaesjM/OEHhOH7D9B76Q5fMnm/M2jduE4/ey+UQfnSbbtHMVnf2NMnYuXrQ0Amk94EtJReyni5F3gzUozFkbQrej0nWOZ9XRAwJV7Ik3cUBE/C+gkNO2Agst9F4yWPe0LWzTEh8=
Received: from BN6PR04MB1044.namprd04.prod.outlook.com (10.174.234.26) by
	BN6PR04MB0546.namprd04.prod.outlook.com (10.173.201.135) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.715.18; Tue, 1 May 2018 13:49:36 +0000
Received: from BN6PR04MB1044.namprd04.prod.outlook.com
	([fe80::1165:c7bb:e554:81b4]) by
	BN6PR04MB1044.namprd04.prod.outlook.com
	([fe80::1165:c7bb:e554:81b4%13]) with mapi id 15.20.0715.024;
	Tue, 1 May 2018 13:49:36 +0000
From: Kirk Sutherland <kirk.sutherland@apisensor.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-ti] cmem.c fails to compile
Thread-Index: AQHT3kyrsse+kUL5TUKdHBz/UCy/jKQaEuEAgADMyYY=
Date: Tue, 1 May 2018 13:49:36 +0000
Message-ID: <BN6PR04MB10449E345CC960E37F470E40E4810@BN6PR04MB1044.namprd04.prod.outlook.com>
References: <BN6PR04MB1044647DA248BB275122B4A0E48D0@BN6PR04MB1044.namprd04.prod.outlook.com>,
	<20180501010004.GA24094@edge>
In-Reply-To: <20180501010004.GA24094@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kirk.sutherland@apisensor.com; 
x-originating-ip: [152.179.181.2]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR04MB0546;
	7:MYi06TfDUsjEkHPD5hx8S2vHeXY8AQe9q1rQd/sh7Y/0JXCKFPNbSLy+SiG5wBQ+hSogek4O5E7JaSardZNDAA5NYRdNMn8Y99IHKDjIUpnWwPAx09X0PXiTPebCx7xwHBnh+ZrEmFq1lIawbIxtYuSaesKA09EA6sRkVeb5jmgm0pLMcXEWujD8f3G50QQrMt7nzbr71iwkpeWcvXb27F04LJG/rj5Qw1hS00MEpL5FbMkLQPURD8iKq/LnTX1C
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0546; 
x-ms-traffictypediagnostic: BN6PR04MB0546:
x-microsoft-antispam-prvs: <BN6PR04MB0546C7E038576546C81C8D74E4810@BN6PR04MB0546.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(31051911155226)(22074186197030)(183786458502308); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(6041310)(20161123562045)(2016111802025)(20161123564045)(20161123558120)(20161123560045)(6043046)(6072148)(201708071742011);
	SRVR:BN6PR04MB0546; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0546; 
x-forefront-prvs: 06592CCE58
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39380400002)(366004)(396003)(39840400004)(346002)(377424004)(189003)(199004)(374574003)(6116002)(7736002)(606006)(3846002)(5890100001)(5250100002)(7696005)(81166006)(25786009)(81156014)(229853002)(486006)(236005)(6306002)(55016002)(8936002)(54896002)(316002)(9686003)(966005)(6506007)(2900100001)(99286004)(8676002)(44832011)(4326008)(446003)(76176011)(11346002)(476003)(14454004)(186003)(6916009)(6246003)(59450400001)(68736007)(2906002)(19627405001)(6606003)(5660300001)(3660700001)(478600001)(53936002)(106356001)(74316002)(86362001)(66066001)(105586002)(53546011)(26005)(3280700002)(6436002)(102836004)(97736004)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0546;
	H:BN6PR04MB1044.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: apisensor.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: sbIoYYk55QmNNEyJP/oecAYuHHNBBd10DhG3CPPv1zC5PqJI9WTOZbXQ1ZbghUuk1UHb9baolgMXJS4KazemPIyAYqP26yZ6Dl6APOpx69J+Dr6qndWy4FUyY4aR0Z36uCzl6AIsfKKOJbjJxj2a3k3RQISwYtwD6B8lotwyXPFaeRtc3xI5ZL4Ztn8ROzRO
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3319c46d-8efa-407d-71e6-08d5af6a605d
X-OriginatorOrg: apisensor.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3319c46d-8efa-407d-71e6-08d5af6a605d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2018 13:49:36.0299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 88d40d3c-11dd-48ad-bc72-689361be940f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0546
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: cmem.c fails to compile
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
X-List-Received-Date: Tue, 01 May 2018 14:22:55 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR04MB10449E345CC960E37F470E40E4810BN6PR04MB1044namp_"

--_000_BN6PR04MB10449E345CC960E37F470E40E4810BN6PR04MB1044namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

  1.  I'm porting firmware written for another board using the DM3730 and i=
t uses dsplink, I'd rather not have to rewrite it to whatever TI is using n=
ow, but I would take an alternative if necessary.
  2.  I'm pulling from krogoth, although I'm not entirely sure what version=
 of gcc it is since I see a version of gcc in a bunch of tmp folders that b=
itbake creates. I've also tried fido with the same results. I'm using the r=
epo script as described in the yocto-manifest page to sync everything.

________________________________
From: Denys Dmytriyenko <denys@ti.com>
Sent: Monday, April 30, 2018 9:00:04 PM
To: Kirk Sutherland
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] cmem.c fails to compile

Couple questions:

1. Any specific reason for gstreamer-ti? It has been deprecated long time a=
go.

2. Which gcc and what version? We've been using cmem for years w/o problems=
.
If using gcc from oe-core, is it the same branch - i.e. krogoth?

--
Denys


On Fri, Apr 27, 2018 at 05:36:43PM +0000, Kirk Sutherland wrote:
> Hi,
>
>
> I've been trying to build gstreamer-ti from the fido or krogoth branch of
> the gumstix/yocto manifest but ran into issues with the meta-ti parts. I =
can
> build the standard console and gumstix images just fine, but when try to
> bitbake gstreamer-ti I get:
>
>
> cmem.c:38:19: fatal error: stdio.h: no such file or directory
>
>
> I'm running it on a 32 bit system and as far as I can tell all the requir=
ed
> libraries for gcc are there, it does make me think it could be related to
> this more recent issue with gcc
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70129 but I'm not really s=
ure
70129 =96 [6 Regression] stdlib.h: No such file or directory ...<https://gc=
c.gnu.org/bugzilla/show_bug.cgi?id=3D70129>
gcc.gnu.org
GCC Bugzilla =96 Bug 70129 [6 Regression] stdlib.h: No such file or directo=
ry when using -isystem /usr/include Last modified: 2018-02-14 04:04:17 UTC



> what is happening here. Any pointers as to how to get this to work or wha=
t
> branch does work would be greatly appreciated.
IMPORTANT NOTICE FROM API: This communication, including any attachments, c=
ontains information that may be confidential or privileged and is intended =
solely for the entity or individual to whom it is addressed. If you are not=
 the intended recipient, please contact the sender immediately and delete t=
his message. Any unauthorized disclosure, copying or distribution of this m=
essage is strictly prohibited.
IMPORTANT NOTICE FROM API: This communication, including any attachments, c=
ontains information that may be confidential or privileged and is intended =
solely for the entity or individual to whom it is addressed. If you are not=
 the intended recipient, please contact the sender immediately and delete t=
his message. Any unauthorized disclosure, copying or distribution of this m=
essage is strictly prohibited.

--_000_BN6PR04MB10449E345CC960E37F470E40E4810BN6PR04MB1044namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p style=3D"margin-top:0; margin-bottom:0"></p>
<ol style=3D"margin-bottom:0px; margin-top:0px">
<li><span style=3D"font-size:12pt"></span>I'm porting firmware written for =
another board using the DM3730 and it uses dsplink, I'd rather not have to =
rewrite it to whatever TI is using now, but I would take an alternative if =
necessary.&nbsp;</li><li>I'm pulling from krogoth, although I'm not entirel=
y sure what version of gcc it is since I see a version of gcc in a bunch of=
 tmp folders that bitbake&nbsp;creates. I've also tried fido with the same =
results. I'm using the repo script as described in the yocto-manifest
 page to sync everything.</li></ol>
<p></p>
</div>
<hr tabindex=3D"-1" disabled=3D"true" style=3D"display:inline-block; width:=
98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Denys Dmytriyenko &lt=
;denys@ti.com&gt;<br>
<b>Sent:</b> Monday, April 30, 2018 9:00:04 PM<br>
<b>To:</b> Kirk Sutherland<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] cmem.c fails to compile</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Couple questions:<br>
<br>
1. Any specific reason for gstreamer-ti? It has been deprecated long time a=
go.<br>
<br>
2. Which gcc and what version? We've been using cmem for years w/o problems=
.<br>
If using gcc from oe-core, is it the same branch - i.e. krogoth?<br>
<br>
--<br>
Denys<br>
<br>
<br>
On Fri, Apr 27, 2018 at 05:36:43PM &#43;0000, Kirk Sutherland wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt;<br>
&gt; I've been trying to build gstreamer-ti from the fido or krogoth branch=
 of<br>
&gt; the gumstix/yocto manifest but ran into issues with the meta-ti parts.=
 I can<br>
&gt; build the standard console and gumstix images just fine, but when try =
to<br>
&gt; bitbake gstreamer-ti I get:<br>
&gt;<br>
&gt;<br>
&gt; cmem.c:38:19: fatal error: stdio.h: no such file or directory<br>
&gt;<br>
&gt;<br>
&gt; I'm running it on a 32 bit system and as far as I can tell all the req=
uired<br>
&gt; libraries for gcc are there, it does make me think it could be related=
 to<br>
&gt; this more recent issue with gcc<br>
&gt; <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70129" id=3D=
"LPlnk229619" class=3D"OWAAutoLink" tabindex=3D"-1" disabled=3D"true" previ=
ewremoved=3D"true">
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70129</a> but I'm not really=
 sure
<div id=3D"LPBorder_GT_15251809547990.7465631343495107" style=3D"margin-bot=
tom:20px; overflow:auto; width:100%; text-indent:0px">
<table id=3D"LPContainer_15251809547940.809259941050112" cellspacing=3D"0" =
style=3D"width:90%; background-color:rgb(255,255,255); overflow:auto; paddi=
ng-top:20px; padding-bottom:20px; margin-top:20px; border-top:1px dotted rg=
b(200,200,200); border-bottom:1px dotted rgb(200,200,200)">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td id=3D"TextCell_15251809547960.03166133480786315" colspan=3D"2" style=3D=
"vertical-align: top; padding: 0px; display: table-cell; position: relative=
;">
<div id=3D"LPRemovePreviewContainer_15251809547960.5837991963962927"></div>
<div id=3D"LPTitle_15251809547960.5642178062284913" style=3D"top:0px; color=
:rgb(0,120,215); font-weight:400; font-size:21px; font-family:wf_segoe-ui_l=
ight,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&quot;,&quot;Segoe UI&q=
uot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif; line-height:21px">
<a id=3D"LPUrlAnchor_15251809547970.9367766414525189" href=3D"https://gcc.g=
nu.org/bugzilla/show_bug.cgi?id=3D70129" target=3D"_blank" tabindex=3D"-1" =
disabled=3D"true" style=3D"text-decoration:none">70129 =96 [6 Regression] s=
tdlib.h: No such file or directory ...</a></div>
<div id=3D"LPMetadata_15251809547970.8469324739557538" style=3D"margin:10px=
 0px 16px; color:rgb(102,102,102); font-weight:400; font-family:wf_segoe-ui=
_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif; =
font-size:14px; line-height:14px">
gcc.gnu.org</div>
<div id=3D"LPDescription_15251809547980.0876089512559799" style=3D"display:=
block; color:rgb(102,102,102); font-weight:400; font-family:wf_segoe-ui_nor=
mal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif; font=
-size:14px; line-height:20px; max-height:100px; overflow:hidden">
GCC Bugzilla =96 Bug 70129 [6 Regression] stdlib.h: No such file or directo=
ry when using -isystem /usr/include Last modified: 2018-02-14 04:04:17 UTC<=
/div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
<br>
&gt; what is happening here. Any pointers as to how to get this to work or =
what<br>
&gt; branch does work would be greatly appreciated.<br>
IMPORTANT NOTICE FROM API: This communication, including any attachments, c=
ontains information that may be confidential or privileged and is intended =
solely for the entity or individual to whom it is addressed. If you are not=
 the intended recipient, please
 contact the sender immediately and delete this message. Any unauthorized d=
isclosure, copying or distribution of this message is strictly prohibited.<=
br>
</div>
</span></font></div>
</div>
IMPORTANT NOTICE FROM API: This communication, including any attachments, c=
ontains information that may be confidential or privileged and is intended =
solely for the entity or individual to whom it is addressed. If you are not=
 the intended recipient, please
 contact the sender immediately and delete this message. Any unauthorized d=
isclosure, copying or distribution of this message is strictly prohibited.
</body>
</html>

--_000_BN6PR04MB10449E345CC960E37F470E40E4810BN6PR04MB1044namp_--

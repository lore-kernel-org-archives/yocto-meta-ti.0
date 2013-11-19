Return-Path: <jithin.raj@nestgroup.net>
Received: from mxout-tvm.nestgroup.net (mxout-tvm.nestgroup.net
	[115.248.23.134])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9861E0053B
	for <meta-ti@yoctoproject.org>; Mon, 18 Nov 2013 21:03:03 -0800 (PST)
Received: from mail-3.tvm.nestgroup.net ([192.168.192.79])
	by mxout-tvm.nestgroup.net (8.13.1/8.13.1) with ESMTP id rAJ4rKke014264
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 10:23:21 +0530
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 19 Nov 2013 10:32:58 +0530
Message-ID: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [meta-ti] pandaboard/omap4 support
Thread-Index: Ac7k5JzjW4HRtlnmRc2mhSaCkQpI3A==
From: "Jithin Raj" <jithin.raj@nestgroup.net>
To: <meta-ti@yoctoproject.org>
Subject: pandaboard/omap4 support
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
X-List-Received-Date: Tue, 19 Nov 2013 05:03:08 -0000
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CEE4E4.9E3BC024"

------_=_NextPart_001_01CEE4E4.9E3BC024
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi ,

=20

I am new to meta-ti.

1) Does meta-ti (master) supports pandaboard(omap4) completely (graphics
with sgx support). Because in the recipie-graphics/libgles these is only
omap3 files ?

=20

2) In-order to support graphics in X11 (hardware graphics acceleration)
I have used=20

=20

       XSERVER +=3D "xserver-xorg \

           xserver-xorg-module-exa \

           xf86-input-evdev \

           xserver-xf86-config \

           xserver-xorg-extension-dbe \

           xserver-xorg-extension-dri \

           xserver-xorg-extension-dri2 \

           xserver-xorg-extension-extmod \

           xserver-xorg-extension-glx \

           xf86-input-mouse \

           xf86-input-keyboard \

           mesa-driver-swrast \

           xf86-video-omap"

=20

       With these option when I run the application am getting a error :

=20

       libEGL warning DRI2: failed to open omap (search paths
/usr/lib/dri)

       PVRShell: EGL 1.4 Initialized

       PVRTTextureLoadFromPointer warning: PVRTC not supported.
Converting to RGBA8888 instead.

       PVRTTextureLoadFromPointer warning: PVRTC not supported.
Converting to RGBA8888 instead.

       PVRTTextureLoadFromPointer warning: PVRTC not supported.
Converting to RGBA8888 instead.

       PVRTTextureLoadFromPointer warning: PVRTC not supported.
Converting to RGBA8888 instead.

=20

                And the graphical application stucks screen after
screen.

=20

Experts please suggest.

=20

Thanks in advance.

=20

Thanks & regards

Jithin Raj

=20

***** Confidentiality Statement/Disclaimer *****

This message and any attachments is intended for the sole use of the inte=
nded recipient. It may contain confidential information. Any unauthorized=
 use, dissemination or modification is strictly prohibited. If you are no=
t the intended recipient, please notify the sender immediately then delet=
e it from all your systems, and do not copy, use or print. Internet commu=
nications are not secure and it is the responsibility of the recipient to=
 make sure that it is virus/malicious code exempt.
The company/sender cannot be responsible for any unauthorized alterations=
 or modifications made to the contents. If you require any form of confir=
mation of the contents, please contact the company/sender. The company/se=
nder is not liable for any errors or omissions in the content of this mes=
sage.


------_=_NextPart_001_01CEE4E4.9E3BC024
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type c=
ontent=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D=
"Microsoft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
=2EMsoChpDefault
	{mso-style-type:export-only;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue v=
link=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal>Hi ,<o:p></o=
:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I a=
m new to meta-ti.<o:p></o:p></p><p class=3DMsoNormal>1) Does meta-ti (mas=
ter) supports pandaboard(omap4) completely (graphics with sgx support). B=
ecause in the recipie-graphics/libgles these is only omap3 files ?<o:p></=
o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>2)=
 In-order to support graphics in X11 (hardware graphics acceleration) I h=
ave used <o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p clas=
s=3DMsoNormal style=3D'text-autospace:none'><span style=3D'font-size:9.0p=
t;font-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XSERVER=
 +=3D &quot;xserver-xorg \<o:p></o:p></span></p><p class=3DMsoNormal styl=
e=3D'text-autospace:none'><span style=3D'font-size:9.0pt;font-family:"Cou=
rier New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x=
server-xorg-module-exa \<o:p></o:p></span></p><p class=3DMsoNormal style=3D=
'text-autospace:none'><span style=3D'font-size:9.0pt;font-family:"Courier=
 New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xf86-=
input-evdev \<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-aut=
ospace:none'><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xserver-xf86-c=
onfig \<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-autospace=
:none'><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xserver-xorg-extensi=
on-dbe \<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-autospac=
e:none'><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xserver-xorg-extens=
ion-dri \<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-autospa=
ce:none'><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xserver-xorg-exten=
sion-dri2 \<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-autos=
pace:none'><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xserver-xorg-ext=
ension-extmod \<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-a=
utospace:none'><span style=3D'font-size:9.0pt;font-family:"Courier New"'>=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xserver-xorg=
-extension-glx \<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-=
autospace:none'><span style=3D'font-size:9.0pt;font-family:"Courier New"'=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xf86-input-=
mouse \<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-autospace=
:none'><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xf86-input-keyboard =
\<o:p></o:p></span></p><p class=3DMsoNormal style=3D'text-autospace:none'=
><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mesa-driver-swrast \<o:p><=
/o:p></span></p><p class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xf86-video-omap&quot;<o:p></o:p><=
/span></p><p class=3DMsoNormal style=3D'text-autospace:none'><span style=3D=
'font-size:9.0pt;font-family:"Courier New"'><o:p>&nbsp;</o:p></span></p><=
p class=3DMsoNormal style=3D'text-autospace:none'><span style=3D'font-siz=
e:9.0pt;font-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; W=
ith these option when I run the application am getting a error :<o:p></o:=
p></span></p><p class=3DMsoNormal style=3D'text-autospace:none'><span sty=
le=3D'font-size:9.0pt;font-family:"Courier New"'><o:p>&nbsp;</o:p></span>=
</p><p class=3DMsoNormal style=3D'text-autospace:none'><i><span style=3D'=
font-size:9.0pt;font-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; libEGL warning DRI2: failed to open omap (search paths /usr/lib/dr=
i)<o:p></o:p></span></i></p><p class=3DMsoNormal style=3D'text-autospace:=
none'><i><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PVRShell: EGL 1.4 Initialized<o:p></o:p></=
span></i></p><p class=3DMsoNormal style=3D'text-autospace:none'><i><span =
style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; PVRTTextureLoadFromPointer warning: PVRTC not supported. =
Converting to RGBA8888 instead.<o:p></o:p></span></i></p><p class=3DMsoNo=
rmal style=3D'text-autospace:none'><i><span style=3D'font-size:9.0pt;font=
-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PVRTTextureLo=
adFromPointer warning: PVRTC not supported. Converting to RGBA8888 instea=
d.<o:p></o:p></span></i></p><p class=3DMsoNormal style=3D'text-autospace:=
none'><i><span style=3D'font-size:9.0pt;font-family:"Courier New"'>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PVRTTextureLoadFromPointer warning: PVRTC =
not supported. Converting to RGBA8888 instead.<o:p></o:p></span></i></p><=
p class=3DMsoNormal style=3D'text-autospace:none'><i><span style=3D'font-=
size:9.0pt;font-family:"Courier New"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; PVRTTextureLoadFromPointer warning: PVRTC not supported. Converting to =
RGBA8888 instead.<o:p></o:p></span></i></p><p class=3DMsoNormal style=3D'=
text-autospace:none'><span style=3D'font-size:9.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
And the graphical application stucks screen after screen.<o:p></o:p></p><=
p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Experts ple=
ase suggest.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p c=
lass=3DMsoNormal>Thanks in advance.<o:p></o:p></p><p class=3DMsoNormal><o=
:p>&nbsp;</o:p></p><p class=3DMsoNormal><b><span style=3D'color:black'>Th=
anks &amp; regards<o:p></o:p></span></b></p><p class=3DMsoNormal><b><span=
 style=3D'color:black'>Jithin Raj<o:p></o:p></span></b></p><p class=3DMso=
Normal><o:p>&nbsp;</o:p></p></div><DIV>&nbsp;</DIV>***** Confidentiality =
Statement/Disclaimer *****<br><br>This message and any attachments is int=
ended for the sole use of the intended recipient. It may contain confiden=
tial information. Any unauthorized use, dissemination or modification is =
strictly prohibited. If you are not the intended recipient, please notify=
 the sender immediately then delete it from all your systems, and do not =
copy, use or print. Internet communications are not secure and it is the =
responsibility of the recipient to make sure that it is virus/malicious c=
ode exempt.<br>The company/sender cannot be responsible for any unauthori=
zed alterations or modifications made to the contents. If you require any=
 form of confirmation of the contents, please contact the company/sender.=
 The company/sender is not liable for any errors or omissions in the cont=
ent of this message.<br></body></html>

------_=_NextPart_001_01CEE4E4.9E3BC024--

Return-Path: <andy.pont@sdcsystems.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C676AE00DB7; Wed, 24 Jul 2019 11:03:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE autolearn=unavailable version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [216.40.44.138 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
X-Greylist: delayed 570 seconds by postgrey-1.32 at yocto-www;
	Wed, 24 Jul 2019 11:03:12 PDT
Received: from smtprelay.hostedemail.com (smtprelay0138.hostedemail.com
	[216.40.44.138])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A98F0E00920
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 11:03:12 -0700 (PDT)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
	[10.5.19.251])
	by smtpgrave05.hostedemail.com (Postfix) with ESMTP id DCC0C1801C438
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 17:53:42 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay06.hostedemail.com (Postfix) with ESMTP id 90932182244EC;
	Wed, 24 Jul 2019 17:53:41 +0000 (UTC)
X-Session-Marker: 616E64792E706F6E744073646373797374656D732E636F6D
X-HE-Tag: brass81_776d40aece026
X-Filterd-Recvd-Size: 5485
Received: from [192.168.10.100] (unknown [5.133.40.160])
	(Authenticated sender: andy.pont@sdcsystems.com)
	by omf14.hostedemail.com (Postfix) with ESMTPA;
	Wed, 24 Jul 2019 17:53:40 +0000 (UTC)
From: "Andy Pont" <andy.pont@sdcsystems.com>
To: meta-ti@yoctoproject.org
Date: Wed, 24 Jul 2019 17:53:36 +0000
Message-Id: <em8e44e63f-388a-4ff6-ace9-d28ccd87f383@andys-imac.local>
User-Agent: eM_Client/7.2.35700.0
Mime-Version: 1.0
Cc: Yocto-mailing-list <yocto@yoctoproject.org>
Subject: Building for AM335x with meta-ti and meta-qt5
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Andy Pont <andy.pont@sdcsystems.com>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 18:03:13 -0000
Content-Type: multipart/alternative;
	boundary="------=_MBE956B789-CE3A-40B0-81FC-3F8B36426D78"

--------=_MBE956B789-CE3A-40B0-81FC-3F8B36426D78
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I am trying to build a Yocto (warrior) image for the AM335x using =0Ameta-t=
i and meta-qt5 that will render directly to the GPU.  Initially =0Athis wil=
l be for the Beaglebone Black but then ultimately will be for a =0Acustom h=
ardware platform.=0A=0AIn broad outline, I think, the software stack needs=
 to look a bit like:=0A=0AQt Application=0AQtBase, QtWebEngine, etc.=0AQt-Op=
enGL=0Ati-sgx-ddk=0AAM335x GPU=0A=0AI have included meta-ti and meta-qt5 in=
to my belayers.conf and added =0Ati-sgx-ddk-km, ti-sgx-ddk-um, qtbase and q=
twebengine to =0AIMAGE_INSTALL_append.  When I try to bitbake core-image-mi=
nimal I start =0Ato get a failure to compile ti-sgx-ddk-km with a number of=
, what appear =0Ato be, warnings of the form:=0A=0AKBUILD_EXTRA_SYMBOLS=3D=
=0A| grep: =0A/home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/amba: =0AIs a directory=0A| grep: =0A/home/me/Yoct=
o/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/include/linux/av=
f: =0AIs a directory=0A=0AIt then ultimately appears to give up with:=0A=0A=
| ******* Multiarch build: no=0A| ******* Primary arch:    target_armel=0A| =
******* Secondary arch:  none=0A| ../config/core.mk:513: $(KERNELDIR)/vmli=
nux does not exist. Kbuild may =0Afail.=0A| eurasiacon/build/linux2/topleve=
l.mk:230: =0Aeurasiacon/build/linux2/moduledefs/target_armel.mk: No such fi=
le or =0Adirectory=0A=0AIs there a specific kernel I need to define in loca=
l.conf that the GPU =0Adrivers build against?=0A=0AAlso, is there any speci=
fic configuration I need to do in order to get =0AQt to use the SGX OpenGL=
 drivers?=0A=0AI have had a search on the web but not found anything for rec=
ent Yocto =0Aversions, only very old stuff.=0A=0A-Andy.=0A=0A

--------=_MBE956B789-CE3A-40B0-81FC-3F8B36426D78
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style id=3D"css_styles">blockquote.cite { margin-left: 5px; ma=
rgin-right: 0px; padding-left: 10px; padding-right:0px; border-left: 1px so=
lid #cccccc }=0Ablockquote.cite2 {margin-left: 5px; margin-right: 0px; padd=
ing-left: 10px; padding-right:0px; border-left: 1px solid #cccccc; margin-t=
op: 3px; padding-top: 0px; }=0Aa img { border: 0px; }=0Ali[style=3D'text-al=
ign: center;'], li[style=3D'text-align: right;'] {  list-style-position: in=
side;}=0Abody { font-family: Verdana; font-size: 12px;   }</style></head><b=
ody class=3D"plain"><div>I am trying to build a Yocto (warrior) image for t=
he AM335x using meta-ti and meta-qt5 that will render directly to the GPU. =
=C2=A0Initially this will be for the Beaglebone Black but then ultimately=
 will be for a custom hardware platform.</div><div><br /></div><div>In broad =
outline, I think, the software stack needs to look a bit like:</div><div><=
br /></div><div>Qt Application</div><div>QtBase, QtWebEngine, etc.</div><di=
v>Qt-OpenGL</div><div>ti-sgx-ddk</div><div>AM335x GPU</div><div><br /></div=
><div>I have included meta-ti and meta-qt5 into my belayers.conf and added=
 ti-sgx-ddk-km, ti-sgx-ddk-um, qtbase and qtwebengine to IMAGE_INSTALL_appen=
d. =C2=A0When I try to bitbake core-image-minimal I start to get a failure=
 to compile ti-sgx-ddk-km with a number of, what appear to be, warnings of t=
he form:</div><div><br /></div><div>KBUILD_EXTRA_SYMBOLS=3D</div><div>| gre=
p: /home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/=
include/linux/amba: Is a directory</div><div>| grep: /home/me/Yocto/BeagleB=
oneBlack/tmp/work-shared/beaglebone/kernel-source/include/linux/avf: Is a d=
irectory</div><div><br /></div><div>It then ultimately appears to give up w=
ith:</div><div><br /></div><div>| ******* Multiarch build: no<br />| ******=
* Primary arch:=C2=A0 =C2=A0 target_armel<br />| ******* Secondary arch:=C2=
=A0 none<br />| ../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. =
Kbuild may fail.<br />| eurasiacon/build/linux2/toplevel.mk:230: eurasiaco=
n/build/linux2/moduledefs/target_armel.mk: No such file or directory</div><=
div><br /></div><div>Is there a specific kernel I need to define in local.c=
onf that the GPU drivers build against?</div><div><br /></div><div>Also, is =
there any specific configuration I need to do in order to get Qt to use th=
e SGX OpenGL drivers?</div><div><br /></div><div>I have had a search on the =
web but not found anything for recent Yocto versions, only very old stuff.=
</div><div><br /></div><div>-Andy.</div><div><br /></div><div><br /></div>=
=0A</body></html>

--------=_MBE956B789-CE3A-40B0-81FC-3F8B36426D78--

Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF8DFE0095D; Sun, 21 Jun 2015 19:31:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 464DAE00793
	for <meta-ti@yoctoproject.org>; Sun, 21 Jun 2015 19:31:15 -0700 (PDT)
Received: by oigb199 with SMTP id b199so70982174oig.3
	for <meta-ti@yoctoproject.org>; Sun, 21 Jun 2015 19:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=FNR7oPLLOloTd0KqIBDQOI2u+fh/v3BS+qFKHZhZhFk=;
	b=PkjehZbIf+HKIAPlXApjagIQux5j64ZCYazzPDdIuMuE6tOft6rgA4EwdGaeFv5w4+
	sMLsfMjd6BE/GhRjMOyIiPPN4Uv+HLP57jviDSFNa512VsNDjcUldvi6H6+SziJIS1E5
	gSNBS7R/euvwqmQr1Ev92i9jQeNlxekSzuo14cninN4QHqGTJkQ+mUrfow9Uk3rhy5ZZ
	8OUyxWT/7hYyW8TQgkvJ16PCChw0bq38jQXEMmuPQ3Mt4rwX+OPMEaTNg40BVMq/AnrY
	hBY4Eo1vf/ORz07TqhvtGPY3f/118+8Hc+cuOqFo1ugBDmQ9Th7GkjsYokwqfYcbqwVs
	G1Bg==
X-Received: by 10.60.134.19 with SMTP id pg19mr17666941oeb.12.1434940275143;
	Sun, 21 Jun 2015 19:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.106.213 with HTTP; Sun, 21 Jun 2015 19:30:55 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 22 Jun 2015 14:30:55 +1200
Message-ID: <CADySD0HpooZtywHpLR+TTjTe_HF5metgV4Fa0M=XwXtPDUd1wQ@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Problem building firefox for AM335x EVM
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
X-List-Received-Date: Mon, 22 Jun 2015 02:31:19 -0000
Content-Type: multipart/alternative; boundary=047d7b471dbe5fde9005191211ed

--047d7b471dbe5fde9005191211ed
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8B=E2=80=8BHi,

I am trying to build firefox for AM335x EVM but having trouble. I am using
arago-daisy-config

In my local.conf I have added:

DISTRO_FEATURES_remove =3D " x11 wayland"
PACKAGECONFIG_remove =3D " x11 wayland"

This is the output from 'bitbake firefox':


ankur@GGL-PC1210:~/ti-arago/new/oe-layersetup/build$ MACHINE=3Dam335x-evm
bitbake -c compile firefox
NOTE: Started PRServer with DBfile:
/home/ankur/ti-arago/new/oe-layersetup/build/cache/prserv.sqlite3, IP:
127.0.0.1, PORT: 36963, PID: 32560
Loading cache: 100%
|##########################################################################=
###########################################################################=
###################|
ETA:  00:00:00
Loaded 2346 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
###########################################################################=
#################|
Time: 00:00:03
Parsing of 1911 .bb files complete (1904 cached, 7 parsed). 2352 targets,
224 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:

/home/ankur/ti-arago/new/oe-layersetup/sources/meta-openembedded/meta-brows=
er/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bbappen=
d
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/libgl' (but
/home/ankur/ti-arago/new/oe-layersetup/sources/meta-openembedded/meta-brows=
er/recipes-mozilla/firefox/
firefox_10.0.11esr.bb DEPENDS on or otherwise requires it)
ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required distro
feature ['opengl'] (not in DISTRO_FEATURES)
ERROR: mesa-gl PROVIDES virtual/libgl but was skipped: missing required
distro feature ['opengl'] (not in DISTRO_FEATURES)
ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required distro
feature ['opengl'] (not in DISTRO_FEATURES)
ERROR: Required build target 'firefox' has no buildable providers.
Missing or unbuildable dependency chain was: ['firefox', 'virtual/libgl']

Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

How to fix this and proceed furthur.

=E2=80=8Bregards
Ankur=E2=80=8B

--047d7b471dbe5fde9005191211ed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">=E2=80=8B=E2=80=8BHi,<br><br>I =
am trying to build firefox for AM335x EVM but having trouble. I am using ar=
ago-daisy-config<br><br>In my local.conf I have added:<br><br>DISTRO_FEATUR=
ES_remove =3D &quot; x11 wayland&quot;<br>PACKAGECONFIG_remove =3D &quot; x=
11 wayland&quot;<br><br>This is the output from &#39;bitbake firefox&#39;:<=
br><br><br>ankur@GGL-PC1210:~/ti-arago/new/oe-layersetup/build$ MACHINE=3Da=
m335x-evm bitbake -c compile firefox<br>NOTE: Started PRServer with DBfile:=
 /home/ankur/ti-arago/new/oe-layersetup/build/cache/prserv.sqlite3, IP: 127=
.0.0.1, PORT: 36963, PID: 32560<br>Loading cache: 100% |###################=
###########################################################################=
##########################################################################|=
 ETA:=C2=A0 00:00:00<br>Loaded 2346 entries from dependency cache.<br>Parsi=
ng recipes: 100% |#########################################################=
###########################################################################=
##################################| Time: 00:00:03<br>Parsing of 1911 .bb f=
iles complete (1904 cached, 7 parsed). 2352 targets, 224 skipped, 0 masked,=
 0 errors.<br>WARNING: No recipes available for:<br>=C2=A0 /home/ankur/ti-a=
rago/new/oe-layersetup/sources/meta-openembedded/meta-browser/recipes-gnome=
/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bbappend<br>NOTE: Resol=
ving any missing task queue dependencies<br>ERROR: Nothing PROVIDES &#39;vi=
rtual/libgl&#39; (but /home/ankur/ti-arago/new/oe-layersetup/sources/meta-o=
penembedded/meta-browser/recipes-mozilla/firefox/<a href=3D"http://firefox_=
10.0.11esr.bb">firefox_10.0.11esr.bb</a> DEPENDS on or otherwise requires i=
t)<br>ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required =
distro feature [&#39;opengl&#39;] (not in DISTRO_FEATURES)<br>ERROR: mesa-g=
l PROVIDES virtual/libgl but was skipped: missing required distro feature [=
&#39;opengl&#39;] (not in DISTRO_FEATURES)<br>ERROR: mesa PROVIDES virtual/=
libgl but was skipped: missing required distro feature [&#39;opengl&#39;] (=
not in DISTRO_FEATURES)<br>ERROR: Required build target &#39;firefox&#39; h=
as no buildable providers.<br>Missing or unbuildable dependency chain was: =
[&#39;firefox&#39;, &#39;virtual/libgl&#39;]<br><br>Summary: There was 1 WA=
RNING message shown.<br>Summary: There were 2 ERROR messages shown, returni=
ng a non-zero exit code.<br><br></div><div class=3D"gmail_default" style=3D=
"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)">How to fix=
 this and proceed furthur.<br><br></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><div cl=
ass=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;co=
lor:rgb(51,51,153)">=E2=80=8Bregards<br></div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)">An=
kur=E2=80=8B</div><br></div></div>

--047d7b471dbe5fde9005191211ed--

Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5537E01473
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 17:12:47 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2R0ClQ3018421
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 19:12:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2R0CluS022364
	for <meta-ti@yoctoproject.org>; Tue, 26 Mar 2013 19:12:47 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 26 Mar 2013 19:12:47 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [nightly] Distroless meta-ti/master minimal build
	2013-03-26_19-50-15
Thread-Index: AQHOKn8B1FNXXpzXN0icqYVtwwYzkZi4qhCA
Date: Wed, 27 Mar 2013 00:12:45 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E7980D9@DLEE08.ent.ti.com>
References: <922516455.95.1364342519091.JavaMail.jenkins@puget>
In-Reply-To: <922516455.95.1364342519091.JavaMail.jenkins@puget>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [nightly] Distroless meta-ti/master minimal build 2013-03-26_19-50-15
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
X-List-Received-Date: Wed, 27 Mar 2013 00:12:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E7980D9DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E7980D9DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok, at least the build now works - for some reason the local copy of yocto-=
kernel-tools was corrupted... I'll see into run-time tests issues next.

--
Denys

________________________________
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Tuesday, March 26, 2013 8:02 PM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] [nightly] Distroless meta-ti/master minimal build 2013-0=
3-26_19-50-15

Status for 03/26/13
BUILD_ID: build-2013-03-26_19-51-17
Clean Build: false
Clean Sources: false
Repository Revisions
Repository

Git URL

Branch

Commit ID

Layers

bitbake

git://git.openembedded.org/bitbake

master

HEAD

layers=3D

meta-ti

git://git.yoctoproject.org/meta-ti

master

HEAD

layers=3D

oe-core

git://git.openembedded.org/openembedded-core

master

HEAD

layers=3Dmeta

Build and Target Test Results
Machine

Build Result

Target Test Result

am335x-evm

PASSED

FAILED

am37x-evm

PASSED

FAILED

am3517-evm

PASSED

FAILED

am180x-evm

PASSED

FAILED: CRITICAL

omap5-evm

PASSED

SKIPPED

keystone-evm

PASSED

FAILED: CRITICAL

beagleboard

PASSED

FAILED

beaglebone

PASSED

SKIPPED

pandaboard

PASSED

SKIPPED


These builds were performed using the build-oesdk.sh script at:

git://arago-project.org/git/projects/tisdk-build-scripts.git

The configuration file passed to this script had the contents:

MANDATORY_INPUTS=3D"MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCR=
IPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER FS_IMAGE_=
TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
TISDK_VERSION=3D"2013.03"
MACHINES=3D"am335x-evm am37x-evm am3517-evm am180x-evm omap5-evm keystone-e=
vm beagleboard beaglebone pandaboard"
NUM_ARM9_BUILDS=3D"1"
NUM_CORTEX_BUILDS=3D"2"
BUILD_ID=3D"`date +build-%F_%H-%M-%S`"
SCRIPTS_ROOT=3D"$PWD"
BUILD_ROOT=3D"/home/jenkins/distroless-build"
TEST_ROOT=3D"$BUILD_ROOT/testing"
PACKAGE_ROOT=3D"$BUILD_ROOT/packaging"
DEPLOY_ROOT=3D"$BUILD_ROOT/deploy/$TISDK_VERSION"
FS_FILTER=3D"core-image-minimal-"
FS_IMAGE_TYPE=3D"tar.gz"
NFS_ROOT=3D"/home/jenkins/nfs-root"
SOURCE_DIR=3D"${BUILD_ROOT}/sources"
CLEAN_BUILD=3D"false"
CLEAN_ALL=3D"false"
CONFIG_FILE=3D"${BUILD_ROOT}/configs/distroless-meta-ti-config.txt"
LOG_DIR=3D"${BUILD_ROOT}/log-files"
DL_DIR=3D"/OE/downloads"
INSTALLER_EXTRAS_ROOT=3D"/home/jenkins/extra-files/installer_content"
TEST_SCRIPTS=3D"$SCRIPTS_ROOT/test-scripts"
TEST_SCRIPTS_TGT=3D"home/root/test-scripts"
TEST_LOCAL_IFACE=3D"eth1"
OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
OPENTEST_TEE_IP=3D"10.218.102.142"
RUN_BUILD_TESTS=3D"true"
STAF_ROOT=3D"/usr/local/staf"
SKIP_TEST_FAILURES=3D"false"
PRODUCTIZE_SDK=3D"false"
BITBAKE_COMMAND=3D"core-image-minimal"
RESULTS_CONFIG_COMMENTS=3D"false"
BACKUP_RESULTS=3D"/home/jenkins/jobs/distroless-meta-ti-nightly/workspace"

--_000_B0581B5571079145BA1CD78C126DBDE72E7980D9DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:ns0=3D"urn:schemas-microsof=
t-com:office:smarttags">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 11 (filtered medium)">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<title>Status for 03/26/13</title>
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
h2
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:18.0pt;
	font-family:"Times New Roman";
	font-weight:bold;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
p
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy">Ok, at least the build now works &#821=
1; for some reason the local copy of yocto-kernel-tools was corrupted&#8230=
; I&#8217;ll see into run-time tests issues
 next.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy"><o:p>&nbsp;</o:p></span></font></p>
<div>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy">--
</span></font><font color=3D"navy"><span style=3D"color:navy"><o:p></o:p></=
span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy">Denys<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"navy" face=3D"Times New Ro=
man"><span style=3D"font-size:12.0pt;color:navy">&nbsp;</span></font><o:p><=
/o:p></p>
</div>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><font=
 size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">
<hr size=3D"2" width=3D"100%" align=3D"center" tabindex=3D"-1">
</span></font></div>
<p class=3D"MsoNormal"><b><font size=3D"2" face=3D"Tahoma"><span style=3D"f=
ont-size:10.0pt;
font-family:Tahoma;font-weight:bold">From:</span></font></b><font size=3D"2=
" face=3D"Tahoma"><span style=3D"font-size:10.0pt;font-family:Tahoma"> meta=
-ti-bounces@yoctoproject.org
 [mailto:meta-ti-bounces@yoctoproject.org] <b><span style=3D"font-weight:bo=
ld">On Behalf Of
</span></b>Dmytriyenko, Denys<br>
<b><span style=3D"font-weight:bold">Sent:</span></b> Tuesday, March 26, 201=
3 8:02 PM<br>
<b><span style=3D"font-weight:bold">To:</span></b> meta-ti@yoctoproject.org=
<br>
<b><span style=3D"font-weight:bold">Subject:</span></b> [meta-ti] [nightly]=
 Distroless meta-ti/master minimal build 2013-03-26_19-50-15</span></font><=
o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:
12.0pt"><o:p>&nbsp;</o:p></span></font></p>
<h2><b><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-size:1=
8.0pt">Status for 03/26/13<o:p></o:p></span></font></b></h2>
<h2><b><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-size:1=
8.0pt">BUILD_ID: build-2013-03-26_19-51-17<o:p></o:p></span></font></b></h2=
>
<h2><b><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-size:1=
8.0pt">Clean Build: false<o:p></o:p></span></font></b></h2>
<h2><b><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-size:1=
8.0pt">Clean Sources: false<o:p></o:p></span></font></b></h2>
<h2><b><u><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-siz=
e:18.0pt">Repository Revisions</span></font></u><o:p></o:p></b></h2>
<table class=3D"MsoNormalTable" border=3D"1" cellspacing=3D"1" cellpadding=
=3D"0">
<tbody>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Repository<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Git URL<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Branch<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Commit ID<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Layers<o:p></o:p></span></font></b></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">bitbake<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://git.openembedded.org/bitbake<o:p></o:p></span>=
</font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">master<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">HEAD<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3D<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">meta-ti<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://git.yoctoproject.org/meta-ti<o:p></o:p></span>=
</font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">master<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">HEAD<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3D<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">oe-core<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://git.openembedded.org/openembedded-core<o:p></o=
:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">master<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">HEAD<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3Dmeta<o:p></o:p></span></font></p>
</td>
</tr>
</tbody>
</table>
<h2><b><u><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-siz=
e:18.0pt">Build and Target Test Results</span></font></u><o:p></o:p></b></h=
2>
<table class=3D"MsoNormalTable" border=3D"1" cellspacing=3D"1" cellpadding=
=3D"0">
<tbody>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Machine<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Build Result<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Target Test Result<o:p></o:p></span></font></b></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">am335x-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">am37x-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">am3517-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">am180x-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED: CRITICAL<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">omap5-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"yellow" style=3D"background:yellow;padding:.75pt .75pt .75pt=
 .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">SKIPPED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">keystone-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED: CRITICAL<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">beagleboard<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">beaglebone<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"yellow" style=3D"background:yellow;padding:.75pt .75pt .75pt=
 .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">SKIPPED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">pandaboard<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"yellow" style=3D"background:yellow;padding:.75pt .75pt .75pt=
 .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">SKIPPED<o:p></o:p></span></font></p>
</td>
</tr>
</tbody>
</table>
<p><font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0p=
t">These builds were performed using the build-oesdk.sh script at:
<o:p></o:p></span></font></p>
<p><font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0p=
t">git://arago-project.org/git/projects/tisdk-build-scripts.git
<o:p></o:p></span></font></p>
<p><font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0p=
t">The configuration file passed to this script had the contents:
<o:p></o:p></span></font></p>
<p><font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0p=
t">MANDATORY_INPUTS=3D&quot;MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUIL=
D_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER F=
S_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION&quot;<br>
TISDK_VERSION=3D&quot;2013.03&quot;<br>
MACHINES=3D&quot;am335x-evm am37x-evm am3517-evm am180x-evm omap5-evm keyst=
one-evm beagleboard beaglebone pandaboard&quot;<br>
NUM_ARM9_BUILDS=3D&quot;1&quot;<br>
NUM_CORTEX_BUILDS=3D&quot;2&quot;<br>
BUILD_ID=3D&quot;`date &#43;build-%F_%H-%M-%S`&quot;<br>
SCRIPTS_ROOT=3D&quot;$PWD&quot;<br>
BUILD_ROOT=3D&quot;/home/jenkins/distroless-build&quot;<br>
TEST_ROOT=3D&quot;$BUILD_ROOT/testing&quot;<br>
PACKAGE_ROOT=3D&quot;$BUILD_ROOT/packaging&quot;<br>
DEPLOY_ROOT=3D&quot;$BUILD_ROOT/deploy/$TISDK_VERSION&quot;<br>
FS_FILTER=3D&quot;core-image-minimal-&quot;<br>
FS_IMAGE_TYPE=3D&quot;tar.gz&quot;<br>
NFS_ROOT=3D&quot;/home/jenkins/nfs-root&quot;<br>
SOURCE_DIR=3D&quot;${BUILD_ROOT}/sources&quot;<br>
CLEAN_BUILD=3D&quot;false&quot;<br>
CLEAN_ALL=3D&quot;false&quot;<br>
CONFIG_FILE=3D&quot;${BUILD_ROOT}/configs/distroless-meta-ti-config.txt&quo=
t;<br>
LOG_DIR=3D&quot;${BUILD_ROOT}/log-files&quot;<br>
DL_DIR=3D&quot;/OE/downloads&quot;<br>
INSTALLER_EXTRAS_ROOT=3D&quot;/home/jenkins/extra-files/installer_content&q=
uot;<br>
TEST_SCRIPTS=3D&quot;$SCRIPTS_ROOT/test-scripts&quot;<br>
TEST_SCRIPTS_TGT=3D&quot;home/root/test-scripts&quot;<br>
TEST_LOCAL_IFACE=3D&quot;eth1&quot;<br>
OPENTEST_CLI=3D&quot;$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz&quot;<br>
OPENTEST_TEE_IP=3D&quot;10.218.102.142&quot;<br>
RUN_BUILD_TESTS=3D&quot;true&quot;<br>
STAF_ROOT=3D&quot;/usr/local/staf&quot;<br>
SKIP_TEST_FAILURES=3D&quot;false&quot;<br>
PRODUCTIZE_SDK=3D&quot;false&quot;<br>
BITBAKE_COMMAND=3D&quot;core-image-minimal&quot;<br>
RESULTS_CONFIG_COMMENTS=3D&quot;false&quot;<br>
BACKUP_RESULTS=3D&quot;/home/jenkins/jobs/distroless-meta-ti-nightly/worksp=
ace&quot;<o:p></o:p></span></font></p>
</div>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E7980D9DLEE08entticom_--

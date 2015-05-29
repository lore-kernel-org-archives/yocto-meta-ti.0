Return-Path: <cjroed@mmm.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF6B4E00998; Fri, 29 May 2015 08:21:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
X-Greylist: delayed 1035 seconds by postgrey-1.32 at yocto-www;
	Fri, 29 May 2015 08:21:44 PDT
Received: from smtp-277A-C.mmm.com (smtp-277a-c.mmm.com [136.229.8.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 617ECE0096A
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 08:21:44 -0700 (PDT)
Received: from mailgate04.mmm.com (unknown [136.229.2.147])
	by Websense Email Security Gateway with ESMTPS id AAB898188A7B4
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 15:04:23 +0000 (GMT)
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,517,1427778000"; 
	d="scan'208,217";a="169220522"
Received: from mail-bn1lp0141.outbound.protection.outlook.com (HELO
	na01-bn1-obe.outbound.protection.outlook.com) ([207.46.163.141])
	by mailgate04c.mmm.com with ESMTP/TLS/AES256-SHA;
	29 May 2015 10:04:25 -0500
Received: from BN3PR0301MB0899.namprd03.prod.outlook.com (10.160.156.141) by
	BN3PR0301MB0899.namprd03.prod.outlook.com (10.160.156.141) with
	Microsoft
	SMTP Server (TLS) id 15.1.172.22; Fri, 29 May 2015 15:04:24 +0000
Received: from BN3PR0301MB0899.namprd03.prod.outlook.com ([10.160.156.141]) by
	BN3PR0301MB0899.namprd03.prod.outlook.com ([10.160.156.141]) with
	mapi id 15.01.0172.012; Fri, 29 May 2015 15:04:24 +0000
From: Chris Roed <cjroed@mmm.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Linux Ti Staging build error
Thread-Index: AQHQmiBnkPvgico7nE6TJ8XLCklG5w==
Date: Fri, 29 May 2015 15:04:24 +0000
Message-ID: <BN3PR0301MB089913AC4A21E512045A15D4CDC90@BN3PR0301MB0899.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=cjroed@mmm.com; 
x-originating-ip: [2601:2:4d00:2b0:c1b:d6dc:1b0:fd68]
x-microsoft-exchange-diagnostics: 1; BN3PR0301MB0899;
	3:8VYMrC5gRQrqHYkP9z207ncnvcPALKhVSfhEkILTakMpLTf4Zld1xbJ4AH9cd5nHepi1Lf8XuivLVwuFZwNzm7Setkxl4BEyF91lDc17q53aSKirtHuh+XBKS95mpB6uCMhIi6ZF3j/vj+XWBMTgRQ==;
	10:lilxSLoYssZqd2kUwyJ/nv2XDVexP8exXy7UGNuRoKLNPzMihYGKh7F/CpsXOa8hSOxznvwcpLMQtoiIQ78iANw7RmiJ0i4/cRqk4BnP90g=;
	6:l+PYjJdqd/LvMpp/JpNS3yuA6FDTn4ViVc3hyYqZe4hTXjfCbO+4ZmxV3KS3GpXA
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB0899;
x-microsoft-antispam-prvs: <BN3PR0301MB08997AB21469A6CEE6E2E159CDC90@BN3PR0301MB0899.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(520003)(5005006)(3002001); SRVR:BN3PR0301MB0899;
	BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB0899; 
x-forefront-prvs: 059185FE08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(189002)(199003)(68736005)(4001540100001)(5001860100001)(122556002)(77156002)(64706001)(77096005)(450100001)(5001830100001)(46102003)(40100003)(2900100001)(54356999)(50986999)(229853001)(2351001)(5002640100001)(102836002)(81156007)(110136002)(99286002)(5001960100002)(33656002)(87936001)(97736004)(107886002)(19627405001)(189998001)(86362001)(105586002)(2656002)(101416001)(106116001)(19625215002)(106356001)(19580405001)(2501003)(92566002)(16236675004)(76576001)(62966003)(74316001)(19580395003)(3826002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR0301MB0899;
	H:BN3PR0301MB0899.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mmm.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: mmm.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2015 15:04:24.7613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: facac3c4-e2a5-4257-af76-205c8a821ddb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB0899
Subject: Linux Ti Staging build error
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
X-List-Received-Date: Fri, 29 May 2015 15:21:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN3PR0301MB089913AC4A21E512045A15D4CDC90BN3PR0301MB0899_"

--_000_BN3PR0301MB089913AC4A21E512045A15D4CDC90BN3PR0301MB0899_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,


This is my first time on a linux mailing list.  I'm not sure of proper etiq=
uette, so let me know if I'm being stupid.


I recently updated my meta-ti to the latest daisy version, and now I'm unab=
le to build the linux-ti-staging kernel.  I've tried completely deleting my=
 tisdk folder and starting from scratch, but I always get this error since =
I upgraded.  I found this quite odd, as the beaglebone doesn't even have a =
dra7 processor.  Has anyone seen this?




|   LD      init/built-in.o

| drivers/built-in.o: In function `hdmi_i2c2_hack_demux':

| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebo=
ne-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2=
/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:11=
7: undefined reference to `dra7_mcasp_hdmi_gpio_set'

| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebo=
ne-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2=
/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:11=
4: undefined reference to `dra7_mcasp_hdmi_gpio_set'

| drivers/built-in.o: In function `hdmi_i2c2_hack_resume_mcasp':

| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebo=
ne-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2=
/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:71=
: undefined reference to `dra7_mcasp_hdmi_gpio_get'

| drivers/built-in.o: In function `hdmi_i2c2_hack_suspend_mcasp':

| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebo=
ne-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2=
/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:76=
: undefined reference to `dra7_mcasp_hdmi_gpio_put'

| drivers/built-in.o: In function `hdmi_i2c2_hack_resume_mcasp':

| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebo=
ne-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2=
/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:71=
: undefined reference to `dra7_mcasp_hdmi_gpio_get'

| drivers/built-in.o: In function `hdmi_i2c2_hack_suspend_mcasp':

| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebo=
ne-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2=
/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:76=
: undefined reference to `dra7_mcasp_hdmi_gpio_put'

| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebo=
ne-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2=
/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd12s015.c:76=
: undefined reference to `dra7_mcasp_hdmi_gpio_put'

| make: *** [vmlinux] Error 1

| ERROR: oe_runmake failed

| WARNING: /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work=
/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r2=
2c-arago2/temp/run.do_compileconfigs.21756:1 exit 1 from

|   exit 1

| ERROR: Function failed: do_compileconfigs (log file is located at /home/c=
hris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-=
gnueabi/linux-ti-staging/3.14.43+gitAUTOINC+1beb9373a9-r22c-arago2/temp/log=
.do_compileconfigs.21756)

ERROR: Task 79 (/home/chris/tisdk/sources/meta-ti/recipes-kernel/linux/linu=
x-ti-staging_3.14.bb, do_compileconfigs) failed with exit code '1'

NOTE: Tasks Summary: Attempted 1293 tasks of which 0 didn't need to be reru=
n and 1 failed.

Waiting for 0 running tasks to finish:


Summary: 1 task failed:

  /home/chris/tisdk/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_3=
.14.bb, do_compileconfigs

Summary: There were 75 WARNING messages shown.

NOTE: Writing buildhistory

chris@officelinux12:~/tisdk/build$


--_000_BN3PR0301MB089913AC4A21E512045A15D4CDC90BN3PR0301MB0899_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div useinlinestyle=3D"true" dir=3D"ltr" style=3D"font-size: 12pt; color: r=
gb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif, 'Apple Col=
or Emoji', 'Segoe UI Emoji', NotoColorEmoji, 'Segoe UI Symbol', 'Android Em=
oji', EmojiSymbols; background-color: rgb(255, 255, 255);">
<p>Hello,&nbsp;</p>
<p><br>
</p>
<p>This is my first time on a linux mailing list. &nbsp;I'm not sure of pro=
per etiquette, so let me know if I'm being stupid.</p>
<p><br>
</p>
<p>I recently updated my meta-ti to the latest daisy version, and now I'm u=
nable to build the linux-ti-staging kernel. &nbsp;I've tried completely del=
eting my tisdk folder and starting from scratch, but I always get this erro=
r since I upgraded. &nbsp;I found this quite
 odd, as the beaglebone doesn't even have a dra7 processor. &nbsp;Has anyon=
e seen this?</p>
<p><br>
</p>
<p><br>
</p>
<p><br>
</p>
<p>| &nbsp; LD &nbsp; &nbsp; &nbsp;init/built-in.o</p>
<p>| drivers/built-in.o: In function `hdmi_i2c2_hack_demux':</p>
<p>| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beagl=
ebone-linux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1beb9373a9-=
r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd=
12s015.c:117: undefined reference to `dra7_mcasp_hdmi_gpio_set'</p>
<p>| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beagl=
ebone-linux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1beb9373a9-=
r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd=
12s015.c:114: undefined reference to `dra7_mcasp_hdmi_gpio_set'</p>
<p>| drivers/built-in.o: In function `hdmi_i2c2_hack_resume_mcasp':</p>
<p>| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beagl=
ebone-linux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1beb9373a9-=
r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd=
12s015.c:71: undefined reference to `dra7_mcasp_hdmi_gpio_get'</p>
<p>| drivers/built-in.o: In function `hdmi_i2c2_hack_suspend_mcasp':</p>
<p>| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beagl=
ebone-linux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1beb9373a9-=
r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd=
12s015.c:76: undefined reference to `dra7_mcasp_hdmi_gpio_put'</p>
<p>| drivers/built-in.o: In function `hdmi_i2c2_hack_resume_mcasp':</p>
<p>| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beagl=
ebone-linux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1beb9373a9-=
r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd=
12s015.c:71: undefined reference to `dra7_mcasp_hdmi_gpio_get'</p>
<p>| drivers/built-in.o: In function `hdmi_i2c2_hack_suspend_mcasp':</p>
<p>| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beagl=
ebone-linux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1beb9373a9-=
r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd=
12s015.c:76: undefined reference to `dra7_mcasp_hdmi_gpio_put'</p>
<p>| /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beagl=
ebone-linux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1beb9373a9-=
r22c-arago2/git/drivers/video/fbdev/omap2/displays-new/dra7-evm-encoder-tpd=
12s015.c:76: undefined reference to `dra7_mcasp_hdmi_gpio_put'</p>
<p>| make: *** [vmlinux] Error 1</p>
<p>| ERROR: oe_runmake failed</p>
<p>| WARNING: /home/chris/tisdk/build/arago-tmp-external-linaro-toolchain/w=
ork/beaglebone-linux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1b=
eb9373a9-r22c-arago2/temp/run.do_compileconfigs.21756:1 exit 1 from</p>
<p>| &nbsp; exit 1</p>
<p>| ERROR: Function failed: do_compileconfigs (log file is located at /hom=
e/chris/tisdk/build/arago-tmp-external-linaro-toolchain/work/beaglebone-lin=
ux-gnueabi/linux-ti-staging/3.14.43&#43;gitAUTOINC&#43;1beb9373a9-r22c-arag=
o2/temp/log.do_compileconfigs.21756)</p>
<p>ERROR: Task 79 (/home/chris/tisdk/sources/meta-ti/recipes-kernel/linux/l=
inux-ti-staging_3.14.bb, do_compileconfigs) failed with exit code '1'</p>
<p>NOTE: Tasks Summary: Attempted 1293 tasks of which 0 didn't need to be r=
erun and 1 failed.</p>
<p>Waiting for 0 running tasks to finish:</p>
<p><br>
</p>
<p>Summary: 1 task failed:</p>
<p>&nbsp; /home/chris/tisdk/sources/meta-ti/recipes-kernel/linux/linux-ti-s=
taging_3.14.bb, do_compileconfigs</p>
<p>Summary: There were 75 WARNING messages shown.</p>
<p>NOTE: Writing buildhistory</p>
<p>chris@officelinux12:~/tisdk/build$&nbsp;</p>
<div><br>
</div>
</div>
</body>
</html>

--_000_BN3PR0301MB089913AC4A21E512045A15D4CDC90BN3PR0301MB0899_--

Return-Path: <prabu@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBDF3E01412
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 20:09:16 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7G39BHF024173;
	Thu, 15 Aug 2013 22:09:12 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7G398UZ024074;
	Thu, 15 Aug 2013 22:09:09 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Fri, 16 Aug 2013 11:09:08 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Christian Gagneraud <chgans@gna.org>
Thread-Topic: [meta-ti] unable to fetch a repository mentioned in SRC_URI
Thread-Index: Ac6Smh64xb634eWdRHC5UAFJ5/QTlwD41GcAAJsXGoD//++OAP/9Z2UA
Date: Fri, 16 Aug 2013 03:09:07 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB97023@DBDE04.ent.ti.com>
References: <2BC3ECFBDE78594E858F96993713F3F9011FA5E2@IGTEMUMMB11.igatecorp.com>
	<20130811182754.GA28453@edge> <520BE875.8030005@gna.org>
	<20130814192941.GB1027@edge>
In-Reply-To: <20130814192941.GB1027@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: unable to fetch a repository mentioned in SRC_URI
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
X-List-Received-Date: Fri, 16 Aug 2013 03:09:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is this resolved - were you able to generate the image ? I seem to be havin=
g a similar issue,=20

regards,
Prabu


-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Thursday, August 15, 2013 1:00 AM
To: Christian Gagneraud
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] unable to fetch a repository mentioned in SRC_URI

On Thu, Aug 15, 2013 at 08:28:37AM +1200, Christian Gagneraud wrote:
> On 08/12/2013 06:27 AM, Denys Dmytriyenko wrote:
> >On Tue, Aug 06, 2013 at 11:43:08AM +0000, Prathamesh P Ghanekar wrote:
> >>Hello,
> >>
> >>I am trying to integrate meta-ti layer into the current yocto=20
> >>project. I wish to build the image for pandaboard.
> >>
> >>I am adding another layer called meta-ivi in the yocto kernel which=20
> >>provided functionality for in-vehicle infotainment systems. In the=20
> >>meta-ivi layer, there is a recipe "foton-image", which builds GENIVI=20
> >>compliant baseline image. Also, few recipes were masked to resolve the =
license issue.
> >>
> >>So, setting all the variables in the conf/local.conf and=20
> >>conf/bblayers.conf file, I build the image as follows.
> >>
> >>
> >>=E8 bitbake foton-image
> >>
> >>
> >>I ended up with following error, which indicates that there's a failure=
 in fetching the repository.
> >>
> >>Here is the output log for your reference:
> >>
> >>prathamesh@mintos ~/workdir/poky-dylan-9.0.1/build $ bitbake=20
> >>foton-image Loading cache: 100%=20
> >>|######################################################################=
#############################################################| ETA:  00:00:=
00 Loaded 1220 entries from dependency cache.
> >>
> >>Build Configuration:
> >>BB_VERSION        =3D "1.18.0"
> >>BUILD_SYS         =3D "i686-linux"
> >>NATIVELSBSTRING   =3D "LinuxMint-14"
> >>TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> >>MACHINE           =3D "pandaboard"
> >>DISTRO            =3D "poky-ivi-systemd"
> >>DISTRO_VERSION    =3D "4.0.2"
> >>TUNE_FEATURES     =3D "armv7a vfp neon"
> >>TARGET_FPU        =3D "vfp-neon"
> >>meta
> >>meta-yocto
> >>meta-yocto-bsp
> >>meta-ivi-4.0.2    =3D "<unknown>:<unknown>"
> >>meta-ti           =3D "master:c14c386946e1ea341faeea292580e37d538d645d"
> >>
> >>NOTE: Resolving any missing task queue dependencies
> >>NOTE: multiple providers are available for u-boot (u-boot,=20
> >>u-boot-ti-staging)
> >>NOTE: consider defining a PREFERRED_PROVIDER entry to match u-boot
> >>NOTE: Preparing runqueue
> >>NOTE: Executing SetScene Tasks
> >>NOTE: Executing RunQueue Tasks
> >>WARNING: Failed to fetch URL=20
> >>git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protoco
> >>l=3Dgit;branch=3Dti-ubuntu-3.4-1487<http://dev.omapzoom.org/pub/scm/int=
e
> >>gration/kernel-ubuntu.git;protocol=3Dgit;branch=3Dti-ubuntu-3.4-1487>,=
=20
> >>attempting MIRRORS if available
> >>ERROR: Fetcher failure: Fetch command failed with exit code 128, output=
:
> >>Cloning into bare repository '/home/prathamesh/workdir/poky-dylan-9.0.1=
/build/downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.gi=
t'...
> >>
> >>fatal: The remote end hung up unexpectedly
> >>fatal: early EOF
> >>fatal: index-pack failed
> >It seems you had your connection terminated unexpectedly... Have you=20
> >tried it again? Does it happen every time?
> >BTW, seems to work fine here...
>=20
> I ran into similar problems recently (strange git failure), but as I=20
> didn't have strong need to build new stuff, I simply gave up straight=20
> away and switched to another task.
> The only "odd" thing I have here, is a *@#$! proxy. I am located in=20
> New Zealand.

And some of our engineers are having weird issues with the proxy as well.=20
Probably a moon phase... :)

--
Denys


> >>ERROR: Function failed: Fetcher failure for URL: 'git://dev.omapzoom.or=
g/pub/scm/integration/kernel-ubuntu.git;protocol=3Dgit;branch=3Dti-ubuntu-3=
.4-1487<http://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;proto=
col=3Dgit;branch=3Dti-ubuntu-3.4-1487>'. Unable to fetch URL from any sourc=
e.
> >>ERROR: Logfile of failure stored in: /home/prathamesh/workdir/poky-dyla=
n-9.0.1/build/tmp-eglibc-eglibc/work/pandaboard-oe-linux-gnueabi/linux-omap=
4/3.4-r0/temp/log.do_fetch.4257
> >>ERROR: Task 910 (/home/prathamesh/workdir/meta-ti/recipes-kernel/linux/=
linux-omap4_3.4.bb<http://linux-omap4_3.4.bb>, do_fetch) failed with exit c=
ode '1'
> >>NOTE: Tasks Summary: Attempted 2323 tasks of which 2231 didn't need to =
be rerun and 1 failed.
> >>Waiting for 0 running tasks to finish:
> >>
> >>Summary: 1 task failed:
> >>   /home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linux-omap4_3.=
4.bb<http://linux-omap4_3.4.bb>, do_fetch
> >>Summary: There was 1 WARNING message shown.
> >>Summary: There were 2 ERROR messages shown, returning a non-zero exit c=
ode.
> >>
> >>Note:
> >>1. I have successfully built the foton-image for target vexpressa9, and=
 it
> >>boots without any errors in the qemu emulator.
> >>2. I am able to 'git clone' the above mentioned repository. If you coul=
d let
> >>me know how can I use the local repository for build process. I tried
> >>copying the repository in downloads folder, but it did not work somehow=
.
> >You need to get a bare repository and place it into:
> >downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git
> >
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


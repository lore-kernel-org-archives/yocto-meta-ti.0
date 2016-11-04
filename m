Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2ACDCE00BC0; Fri,  4 Nov 2016 13:20:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB474E007C2
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2016 13:20:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id uA4KKawf007012;
	Fri, 4 Nov 2016 15:20:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA4KKaQD021959;
	Fri, 4 Nov 2016 15:20:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 4 Nov 2016 15:20:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uA4KKZLb013823;
	Fri, 4 Nov 2016 15:20:35 -0500
Date: Fri, 4 Nov 2016 16:20:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "=?utf-8?B?0KjQsNGA0LjRhdC40L0g0JTQvNC40YLRgNC40Lkg0KHQtdGA0LPQtdC10LI=?=
	=?utf-8?B?0LjRhw==?=" <SharihinDS@energomera.ru>
Message-ID: <20161104202035.GT12745@edge>
References: <1478251939.5248.11.camel@energomera.ru>
MIME-Version: 1.0
In-Reply-To: <1478251939.5248.11.camel@energomera.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Unable to build ti-ccsv6-native and other packages
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
X-List-Received-Date: Fri, 04 Nov 2016 20:20:50 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2016 at 09:32:19AM +0000, =D0=A8=D0=B0=D1=80=D0=B8=D1=85=D0=
=B8=D0=BD =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=A1=D0=B5=D1=80=D0=
=B3=D0=B5=D0=B5=D0=B2=D0=B8=D1=87 wrote:
> Hi all,
> A few days ago it was announced the release of Yocto 2.2, so I decided to=
=20
> rebuild whole distro.
>=20
> 1. When I started bitbake, I've found that there's no Doxygen package in=
=20
> base Yocto/Poky distro, so I've copied one from meta-arago-extras. What's=
=20
> the correct way to workaround this issue?

meta-arago-extras is just another layer that can be added.


> 2. [Main issue] When bitbake tries to build ti-ccsv6-native there is a er=
ror:
>=20
> WARNING: ti-ccsv6-native-6.1.3.00034-r0 do_fetch: Failed to fetch URL htt=
p://install.source.dir.local/CCS6.1.3.00034_linux.tar.gz;name=3Dccsv6, atte=
mpting MIRRORS if available
> ERROR: ti-ccsv6-native-6.1.3.00034-r0 do_fetch: Fetcher failure: Fetch co=
mmand export DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-aH3buan9=
8u,guid=3De17812544d78610aef8cfc9f581c3d0c"; export SSH_AGENT_PID=3D"1525";=
 export SSH_AUTH_SOCK=3D"/tmp/ssh-LRkwiDyVSVf5/agent.1479"; export PATH=3D"=
/home/sharihinds/CL-SOM-AM57x/morty/scripts/native-intercept:/home/sharihin=
ds/CL-SOM-AM57x/morty/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/ho=
me/sharihinds/CL-SOM-AM57x/morty/scripts:/home/sharihinds/CL-SOM-AM57x/mort=
y/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux:/home/sharihinds/CL-=
SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/usr/bin:/home/sharihinds/CL=
-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/usr/sbin:/home/sharihinds/=
CL-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/usr/bin:/home/sharihinds=
/CL-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/sbin:/home/sharihinds/C=
L-SOM-AM57x/morty/build/tmp/sysroots/x86_64-linux/bin:/home/sharihinds/CL-S=
OM-AM57x/morty/scripts:/home/sharihinds/CL-SOM-AM57x/morty/bit
> bake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/us=
r/games:/usr/local/games:/snap/bin"; export HOME=3D"/home/sharihinds"; /usr=
/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P /home/=
sharihinds/CL-SOM-AM57x/downloads 'http://install.source.dir.local/CCS6.1.3=
=2E00034_linux.tar.gz' --progress=3Ddot -v failed with exit code 4, output:
> --2016-11-04 12:07:14--  http://install.source.dir.local/CCS6.1.3.00034_l=
inux.tar.gz
> Resolving install.source.dir.local (install.source.dir.local)... failed: =
Name or service not known.
> wget: unable to resolve host address =E2=80=98install.source.dir.local=E2=
=80=99
>=20
> ERROR: ti-ccsv6-native-6.1.3.00034-r0 do_fetch: Fetcher failure for URL: =
'http://install.source.dir.local/CCS6.1.3.00034_linux.tar.gz;name=3Dccsv6'.=
 Unable to fetch URL from any source.
> ERROR: ti-ccsv6-native-6.1.3.00034-r0 do_fetch: Function failed: base_do_=
fetch
> ERROR: Logfile of failure stored in: /home/sharihinds/CL-SOM-AM57x/morty/=
build/tmp/work/x86_64-linux/ti-ccsv6-native/6.1.3.00034-r0/temp/log.do_fetc=
h.13158
> ERROR: Task (/home/sharihinds/CL-SOM-AM57x/morty/build/../meta-ti/recipes=
-ti/devtools/ti-ccsv6-native_6.1.3.00034.bb:do_fetch) failed with exit code=
 '1'
>=20
> Error reveals when I add ipumm-fw in dependency of kernel.
>=20
> Does anybody encountered same problem? How can I fix this issue?

CCS requires manual download due to licensing - install.source.dir.local is=
 a=20
fake address and a placeholder to fail download attempts if CCS tarball was=
=20
not already provided.

The original commit had that info:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/recipes-ti/devtool=
s?id=3Dffeefcb8e537d7f26eca186866075667bfac9fa7

The recipe itself also points to the Wiki with download links:
http://processors.wiki.ti.com/index.php/Download_CCS#Code_Composer_Studio_V=
ersion_6_Downloads

--=20
Denys


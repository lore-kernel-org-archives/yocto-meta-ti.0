Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 47F2CE01466
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2013 01:27:50 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Wed, 8 May 2013
	10:27:39 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 8FA43288CEC;
	Wed,  8 May 2013 10:27:43 +0200 (CEST)
Date: Wed, 8 May 2013 10:27:43 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: <m-karicheri2@ti.com>
Message-ID: <20130508082743.GA36018@sestofb10.enea.se>
MIME-Version: 1.0
In-Reply-To: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RESEND: PATCH 1/3] keystone2: boot-monitor: update to pull code from tip of the master
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
X-List-Received-Date: Wed, 08 May 2013 08:27:50 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 07, 2013 at 05:24:17PM -0400, Murali Karicheri wrote:
 > This patch is needed to switch between release tag (when doing release
 > build) and tip of the master (when building nightly)
 >=B7
 > Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
 > ---
 >  recipes-bsp/boot-monitor/boot-monitor_git.bb |    6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)
 >=B7
 > diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/=
boot-monitor/boot-monitor_git.bb
 > index c8a022a..a892720 100644
 > --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
 > +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
 > @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D25fe219a6feb=
f6e5bb45beda1b2eb315"
 >=B7=B7
 >  COMPATIBLE_MACHINE =3D "keystone-evm"
 >=B7=B7
 > -SRC_URI =3D "git://arago-project.org/git/projects/boot-monitor.git;prot=
ocol=3Dgit;branch=3D${BRANCH}"
 > +#SRC_URI =3D"git://arago-project.org/git/projects/boot-monitor.git;prot=
ocol=3Dgit;branch=3D${BRANCH}"
 > +SRC_URI =3D"git://gtgit01.gt.design.ti.com/git/projects/boot-monitor.gi=
t;protocol=3Dgit;branch=3D${BRANCH}"

While attempting to clone this repo,  "git clone git://gtgit01.gt.design.ti=
.com/git/projects/boot-monitor.git",
I get the following error message:=20

cloning into 'boot-monitor'...
fatal: unable to connect to gtgit01.gt.design.ti.com:
gtgit01.gt.design.ti.com: Name or service not known

Do this access problem has something to do with my local firewall
settings or somebody else also face the same problem ?=20

Best Regards,
Maxin


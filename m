Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 189F2E01607
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 06:30:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QDUTMa019098
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 08:30:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QDUTo7008140;
	Thu, 26 Sep 2013 08:30:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 08:30:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QDUT4d030758;
	Thu, 26 Sep 2013 08:30:29 -0500
Date: Thu, 26 Sep 2013 09:30:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Muddegowda, Deepak" <x0171695@ti.com>
Message-ID: <20130926133028.GC14528@edge>
References: <1380112791-22545-1-git-send-email-x0171695@ti.com>
	<1380112791-22545-3-git-send-email-x0171695@ti.com>
	<7D46E86EC0A8354091174257B2FED1015974D61C@DLEE11.ent.ti.com>
	<16D38216B6B8BA4B9AF9DBFC3760F38D3F14DDC5@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015974D711@DLEE11.ent.ti.com>
	<16D38216B6B8BA4B9AF9DBFC3760F38D3F14DEB7@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <16D38216B6B8BA4B9AF9DBFC3760F38D3F14DEB7@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Mankad, Maulik Ojas" <maulik@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"epos_dev@list.ti.com - Internal mailing list for EPOS dev team \(May
	contain non-TIers\)" <epos_dev@list.ti.com>, "Srinivasan,
	Nageswari" <nageswari@ti.com>
Subject: Re: [meta-ti patch v3 2/3] am43xx: Added the u-boot recipe
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
X-List-Received-Date: Thu, 26 Sep 2013 13:30:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 26, 2013 at 07:42:43AM -0400, Muddegowda, Deepak wrote:
> 
> 
> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Wednesday, September 25, 2013 7:18 PM
> > To: Muddegowda, Deepak; Srinivasan, Nageswari; Heroor, Siddharth;
> > Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
> > epos_dev@list.ti.com - Internal mailing list for EPOS dev team (May
> > contain non-TIers); meta-ti@yoctoproject.org
> > Subject: RE: [meta-ti patch v3 2/3] am43xx: Added the u-boot recipe
> > 
> > >-----Original Message-----
> > >From: Muddegowda, Deepak
> > >Sent: Wednesday, September 25, 2013 8:46 AM
> > >To: Maupin, Chase; Srinivasan, Nageswari; Heroor, Siddharth; Cooper
> > >Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
> > >epos_dev@list.ti.com - Internal mailing list for EPOS dev team (May
> > >contain non-TIers); meta-ti@yoctoproject.org
> > >Subject: RE: [meta-ti patch v3 2/3] am43xx: Added the u-boot recipe
> > >
> > >
> > >
> > >> -----Original Message-----
> > >> From: Maupin, Chase
> > >> Sent: Wednesday, September 25, 2013 7:14 PM
> > >> To: Muddegowda, Deepak; Srinivasan, Nageswari; Heroor,
> > >Siddharth;
> > >> Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
> > >> epos_dev@list.ti.com - Internal mailing list for EPOS dev team
> > >(May
> > >> contain non-TIers); meta-ti@yoctoproject.org
> > >> Subject: RE: [meta-ti patch v3 2/3] am43xx: Added the u-boot
> > >recipe
> > >>
> > >> >-----Original Message-----
> > >> >From: Muddegowda, Deepak
> > >> >Sent: Wednesday, September 25, 2013 7:40 AM
> > >> >To: Srinivasan, Nageswari; Maupin, Chase; Heroor, Siddharth;
> > >Cooper
> > >> >Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
> > >Muddegowda,
> > >> >Deepak; epos_dev@list.ti.com - Internal mailing list for EPOS
> > >dev team
> > >> >(May contain non-TIers); meta- ti@yoctoproject.org
> > >> >Subject: [meta-ti patch v3 2/3] am43xx: Added the u-boot recipe
> > >> >
> > >> >Added the LIC_FILES_CHKSUM in the recipe as the default
> > >checksum was
> > >> >pointing to the COPYING file which is moved to the
> > >Licenses/gpl-
> > >> 2.0.txt
> > >> >in the current source.
> > >> >
> > >> >Signed-off-by: Deepak M <x0171695@ti.com>
> > >> >---
> > >> >v3:
> > >> >1. Changed the u-boot recipe name from u-boot-aegis to u-boot-
> > >am43xx.
> > >> >2. Using externel source link.
> > >> >
> > >> > recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb | 20
> > >> >++++++++++++++++++++
> > >> > 1 file changed, 20 insertions(+)
> > >> > create mode 100644 recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
> > >> >
> > >> >diff --git a/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
> > >> >b/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
> > >>
> > >> My assumption is this is a temporary recipe correct?  Once the
> > >unified
> > >> u-boot recipe in is place you can then just append what you need
> > >on top
> > >> right?
> > >[Muddegowda, Deepak] Not exactly temporary, may change the SRC_URI in
> > >future that's it.
> > 
> > OK.  Now my question is why?  If you are given a base u-boot recipe
> > that supports am43xx devices why would you define your own instead of
> > appending?
> > 
> [Muddegowda, Deepak] But there was no recipe for the u-boot 2013.10. 

Here's one:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/u-boot/u-boot-ti-staging_git.bb


> > >>
> > >> >new file mode 100644
> > >> >index 0000000..58eb99a
> > >> >--- /dev/null
> > >> >+++ b/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
> > >> >@@ -0,0 +1,20 @@
> > >> >+require u-boot-ti.inc
> > >> >+
> > >> >+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> > >> >+LIC_FILES_CHKSUM = "file://Licenses/gpl-
> > >> >2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > >> >+COMPATIBLE_MACHINE = "am437x-epos-evm"
> > >> >+
> > >> >+DEFAULT_PREFERENCE = "-1"
> > >> >+
> > >> >+PV = "2013.10"
> > >> >+PR = "r0+gitr${SRCPV}"
> > >> >+
> > >> >+BRANCH = "v2013.10-rc2+"
> > >> >+
> > >> >+SRC_URI = "git://git.ti.com/~lokesh/ti-u-boot/u-boot-
> > >> >dev.git;protocol=git;branch=${BRANCH}"
> > >> >+
> > >> >+# Lock to the commit corresponding
> > >> >+SRCREV = "6514cf76a52ecce9b03ede098683a7eea97e2bce"
> > >> >+
> > >> >+# Set the name of the SPL that will built so that it is also
> > >> >packaged with u-boot.
> > >> >+SPL_BINARY = "MLO"
> > >> >--
> > >> >1.8.1
> 


Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EBC4E0141D
	for <meta-ti@yoctoproject.org>; Thu,  2 Aug 2012 15:06:23 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q72M6MmX021974
	for <meta-ti@yoctoproject.org>; Thu, 2 Aug 2012 17:06:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q72M6M9L011583
	for <meta-ti@yoctoproject.org>; Thu, 2 Aug 2012 17:06:22 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 2 Aug 2012 17:06:22 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q72M6MqS012909;
	Thu, 2 Aug 2012 17:06:22 -0500
Date: Thu, 2 Aug 2012 18:06:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tom Rini <trini@ti.com>
Message-ID: <20120802220621.GD28560@edge>
References: <20120726013212.1F5DA52AA6@arago-project.org>
	<CC361C01.B0548%jdk@ti.com> <20120801191214.GD16076@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20120801191214.GD16076@bill-the-cat>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Koen Kooi : u-boot 2011.09+git: update to latest version of Tom Rini's tree
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 22:06:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 01, 2012 at 12:12:14PM -0700, Tom Rini wrote:
> On Thu, Jul 26, 2012 at 01:57:27AM +0000, Kridner, Jason wrote:
> > 
> > -----Original Message-----
> > From: Arago Project git <git@arago-project.org>
> > Date: Wednesday, July 25, 2012 9:32 PM
> > To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> > Subject: [meta-ti] Koen Kooi : u-boot 2011.09+git: update to latest
> > version	of Tom Rini's tree
> > 
> > >Module: meta-ti
> > >Branch: master
> > >Commit: e1b4ab72cfb3ea4599701d1600c44fe3c5f8ba66
> > >URL:    
> > >http://arago-project.org/git/meta-ti.git?a=commit;h=e1b4ab72cfb3ea4599701d
> > >1600c44fe3c5f8ba66
> > >
> > >Author: Koen Kooi <koen@dominion.thruhere.net>
> > >Date:   Wed Jul 11 11:53:27 2012 +0200
> > >
> > >u-boot 2011.09+git: update to latest version of Tom Rini's tree
> > 
> > Aren't all of Tom's patches upstream now?  Why not pull from the latest
> > u-boot release? Are we carrying any patches that would be accepted
> > upstream?
> 
> Late to the party, I know.  v2012.07 has extremely minimal support for
> am335x platforms.  With 3 series of patches (which I expect to queue up
> and push along to u-boot-arm and then u-boot proper) mainline support
> should be better, at least wrt bone, than the arago tree.  NAND and SPI
> and MMC1 won't be there, yet.  i2c, ethernet, booting kernels will be
> there.  And easier than arago eeprom programming will be there too
> (eeprom command in U-Boot for dumping memory to eeprom).

Tom,

Why are you comparing to "arago u-boot"? Isn't that your tree also? :)

-- 
Denys


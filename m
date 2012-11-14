Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22F8AE0142C
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 17:37:54 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAE1bqwX012827;
	Tue, 13 Nov 2012 19:37:52 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAE1bq9M000794;
	Tue, 13 Nov 2012 19:37:52 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 13 Nov 2012 19:37:51 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qAE1bpAC001026;
	Tue, 13 Nov 2012 19:37:51 -0600
Date: Tue, 13 Nov 2012 20:37:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Flavio Castro Alves Filho <flavio.alves@gmail.com>
Message-ID: <20121114013751.GB13096@edge>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
	<alpine.DEB.2.02.1211131041310.4591@oneiric>
	<20121113154444.GB12650@edge>
	<CAFNBftf5ACAEFEtLpoVB3b9pc_d1MROgn19NBJmQWX2u362Ucw@mail.gmail.com>
	<50A2C0E8.9030300@r-finger.com>
	<CAFNBftdZC1BUCUA+zonbgkFshzft=ba=BYyTBKFKTXBOo_DVsA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFNBftdZC1BUCUA+zonbgkFshzft=ba=BYyTBKFKTXBOo_DVsA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Wed, 14 Nov 2012 01:37:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 13, 2012 at 11:10:31PM -0200, Flavio Castro Alves Filho wrote:
> 2012/11/13 Tomas Frydrych <tf+lists.yocto@r-finger.com>
> 
> | make[1]: /arm-poky-linux-gnueabi-gcc: Command not found

^^^^^^^^^

Yes, some of the recipes in meta-ti still use old TOOLCHAIN_* vars from 
Classic OE, which were set specifically to allow building packages either 
with an internal toolchain or with an external prebuilt one. In OE-Core or 
Yocto/Poky those vars are not set by default, as it's left for the 
distribution to deal with setting up any fancy toolchain business.  You'd 
need to add something like this to your config file:

TOOLCHAIN_PATH ?= "${STAGING_BINDIR_TOOLCHAIN}"
TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"

-- 
Denys


Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A973E008F2; Fri,  3 Mar 2017 11:11:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2ED33E00839
	for <meta-ti@yoctoproject.org>; Fri,  3 Mar 2017 11:11:26 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23JBP7i001257
	for <meta-ti@yoctoproject.org>; Fri, 3 Mar 2017 13:11:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488568285;
	bh=wze/gwOHc1LRXfmYMPbP9eUFxNrZKnSyMq9BY+3w2q8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=t3RnZehYo5f2wxY1ox++E6+WL2tn84tumtDEiIJcHzzeWvN13PX+F5hEBeN7IUae6
	n4eYwdtSmz3T3adRY5rG4QJ3mhtiNWx7UTS7nYGagzW0M3lwuMl3/snJS4aeFo4v8g
	2t802WFaLAoGaWb2VDTWoVHDvX5YOCdc+5FtxU1o=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23JBPXC024153
	for <meta-ti@yoctoproject.org>; Fri, 3 Mar 2017 13:11:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Mar 2017 13:11:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23JBP1Q015608;
	Fri, 3 Mar 2017 13:11:25 -0600
Date: Fri, 3 Mar 2017 14:11:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20170303191124.GJ12614@edge>
References: <1488496648-61231-1-git-send-email-denys@ti.com>
	<4B26FB5A64EBA14C87266869E037F958253B3B2E@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958253B3B2E@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty/master][PATCH] conf/machine: bump Keystone max_leb_cnt by 10% to fit debug images
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
X-List-Received-Date: Fri, 03 Mar 2017 19:11:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 03, 2017 at 06:10:39AM -0500, Stiffler, Jacob wrote:
> If I recall correctly, these sizes are the maximum they can be to fit the 
> UBIFS image into the NAND.
> 
> The tisdk-server-extra-rootfs-image was created to produce images which 
> exceed the limitations of the board.

Then we need to move something to the "extra" image again, otherwise "debug" 
builds (and those are only kernel debug, not userspace) no longer fit in the 
main image...


> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  conf/machine/k2e-evm.conf  | 2 +-
> >  conf/machine/k2g-evm.conf  | 2 +-
> >  conf/machine/k2hk-evm.conf | 2 +-
> >  conf/machine/k2l-evm.conf  | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
> > index 95b0e42..bb6b5fb 100644
> > --- a/conf/machine/k2e-evm.conf
> > +++ b/conf/machine/k2e-evm.conf
> > @@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
> >  # UBI: logical eraseblock size:    126976 bytes
> >  # from ubiattach stdout:
> >  # UBI device number 0, total 3856 LEBs
> > -MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
> > +MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4400"
> > 
> >  # do ubiattach /dev/ubi_ctrl -m 4
> >  # from dmesg:
> > diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
> > index 458dfe4..997406b 100644
> > --- a/conf/machine/k2g-evm.conf
> > +++ b/conf/machine/k2g-evm.conf
> > @@ -26,7 +26,7 @@ SYSVINIT_ENABLED_GETTYS = ""
> >  # UBI: logical eraseblock size:    253952 bytes
> >  # from ubiattach stdout:
> >  # UBI device number 0, total 1926 LEBs
> > -MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
> > +MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2200"
> > 
> >  # do ubiattach /dev/ubi_ctrl -m 4
> >  # from dmesg:
> > diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
> > index 6adb016..88d1608 100644
> > --- a/conf/machine/k2hk-evm.conf
> > +++ b/conf/machine/k2hk-evm.conf
> > @@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
> >  # UBI: logical eraseblock size:    126976 bytes
> >  # from ubiattach stdout:
> >  # UBI device number 0, total 3856 LEBs
> > -MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
> > +MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4400"
> > 
> >  # do ubiattach /dev/ubi_ctrl -m 4
> >  # from dmesg:
> > diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
> > index b4721d0..9b00a20 100644
> > --- a/conf/machine/k2l-evm.conf
> > +++ b/conf/machine/k2l-evm.conf
> > @@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
> >  # UBI: logical eraseblock size:    253952 bytes
> >  # from ubiattach stdout:
> >  # UBI device number 0, total 1926 LEBs
> > -MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
> > +MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2200"
> > 
> >  # do ubiattach /dev/ubi_ctrl -m 4
> >  # from dmesg:
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


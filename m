Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99970E00D30; Tue, 26 Sep 2017 10:02:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D4E1E00C3A
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 10:02:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8QH25WF017784
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 12:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506445325;
	bh=kt0WmbHJfoQnsMUj32nPIKTk+v7WZlKhxUmQFRnR/3Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rS/ntlgThWUZu8G4hv8vlCtC5w6o+W3GnY+e8qyLp8xakBfpYeY5EYYeqB9kXu2LR
	nQn3AvzcRzC1X76Zl9XTUgyUUlddm4iGjqjqLFp3Gke6kzC9zDEUpyE0xtxTEIzof5
	Em/LVuhPMOyi5SyvJhqy43zJviELlgckE4/ZiL4w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QH25gD005720
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 12:02:05 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 26 Sep 2017 12:02:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 26 Sep 2017 12:02:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8QH22d3026681;
	Tue, 26 Sep 2017 12:02:02 -0500
Date: Tue, 26 Sep 2017 13:01:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20170926170147.GY26843@edge>
References: <1504651660-6772-1-git-send-email-a0271529@ti.com>
	<2E957F12D11D904590FA9AF86D366BD926D827A3@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926D827A3@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] conf/machine: add pru-uio dtbs in KERNEL_DEVICETREE for am3/am4/am5/k2g
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
X-List-Received-Date: Tue, 26 Sep 2017 17:02:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same comment as with linux-ti-staging patch.


On Mon, Sep 25, 2017 at 05:53:00PM +0000, Gou, Hongmei wrote:
> Ping...
> 
> > -----Original Message-----
> > From: Gou, Hongmei
> > Sent: Tuesday, September 05, 2017 6:48 PM
> > To: meta-ti@yoctoproject.org
> > Cc: Gou, Hongmei
> > Subject: [meta-ti] [PATCH] conf/machine: add pru-uio dtbs in
> > KERNEL_DEVICETREE for am3/am4/am5/k2g
> > 
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  conf/machine/am57xx-evm.conf   | 3 ++-
> >  conf/machine/include/ti33x.inc | 2 +-
> >  conf/machine/include/ti43x.inc | 2 +-
> >  conf/machine/k2g-evm.conf      | 3 ++-
> >  4 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-
> > evm.conf index 3bc2d13..78f56e6 100644
> > --- a/conf/machine/am57xx-evm.conf
> > +++ b/conf/machine/am57xx-evm.conf
> > @@ -14,7 +14,8 @@ KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb
> > am57xx-beagle-x15-revb1.dtb \
> >                      am57xx-evm.dtb am57xx-evm-cam-mt9t111.dtb am57xx-evm-
> > cam-ov10635.dtb \
> >                      am57xx-evm-reva3.dtb am57xx-evm-reva3-cam-mt9t111.dtb
> > am57xx-evm-reva3-cam-ov10635.dtb \
> >                      am571x-idk.dtb am571x-idk-lcd-osd101t2045.dtb am571x-idk-lcd-
> > osd101t2587.dtb \
> > -                    am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-
> > osd101t2587.dtb"
> > +                    am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb am572x-idk-lcd-
> > osd101t2587.dtb \
> > +                    ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am572x-idk-
> > pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
> > 
> >  UBOOT_MACHINE = "am57xx_evm_config"
> > 
> > diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> > index cadc7df..4014f79 100644
> > --- a/conf/machine/include/ti33x.inc
> > +++ b/conf/machine/include/ti33x.inc
> > @@ -26,7 +26,7 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> > 
> >  KERNEL_IMAGETYPE = "zImage"
> > 
> > -KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb am335x-
> > bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb"
> > +KERNEL_DEVICETREE = "am335x-evm.dtb am335x-evmsk.dtb am335x-
> > bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb
> > ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-
> > uio.dtb', '', d)}"
> > 
> >  UBOOT_ARCH = "arm"
> >  UBOOT_MACHINE = "am335x_evm_config"
> > diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> > index 2d563ee..243bc5a 100644
> > --- a/conf/machine/include/ti43x.inc
> > +++ b/conf/machine/include/ti43x.inc
> > @@ -26,7 +26,7 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> > 
> >  KERNEL_IMAGETYPE = "zImage"
> > 
> > -KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-
> > gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
> > +KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-
> > gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb
> > ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-
> > uio.dtb', '', d)}"
> > 
> >  UBOOT_ARCH = "arm"
> >  UBOOT_MACHINE = "am43xx_evm_config"
> > diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf index
> > 3222868..da0234b 100644
> > --- a/conf/machine/k2g-evm.conf
> > +++ b/conf/machine/k2g-evm.conf
> > @@ -6,7 +6,8 @@ require conf/machine/include/k2g.inc
> > 
> >  MACHINE_FEATURES += "alsa"
> > 
> > -KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb
> > keystone-k2g-ice.dtb"
> > +KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb
> > keystone-k2g-ice.dtb \
> > +                     ${@base_conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-
> > k2g-ice-pru-excl-uio.dtb', '', d)}"
> > 
> >  UBOOT_MACHINE = "k2g_evm_config"
> > 
> > --
> > 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


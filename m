Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA055E007C1; Tue,  7 Oct 2014 13:59:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,HDRS_LCASE,
	RCVD_IN_DNSWL_NONE,T_MANY_HDRS_LCASE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 HDRS_LCASE Odd capitalization of message header
	* 0.0 T_MANY_HDRS_LCASE Odd capitalization of multiple message headers
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BEBC0E0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 13:58:59 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0ND3002CSE9QLZT0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 07 Oct 2014 15:58:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 087AD20261; Tue,
	07 Oct 2014 16:58:38 -0400 (EDT)
Date: Tue, 07 Oct 2014 16:58:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-id: <20141007205837.GF25997@denix.org>
References: <540B960B.6080907@pabigot.com> <54197BBF.6070004@pabigot.com>
MIME-version: 1.0
In-reply-to: <54197BBF.6070004@pabigot.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: mis-definition of SLEWCTRL_FAST in dt-bindings amxxxx header
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
X-List-Received-Date: Tue, 07 Oct 2014 20:59:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Wasn't this already fixed upstream?

On Wed, Sep 17, 2014 at 07:17:03AM -0500, Peter A. Bigot wrote:
> Any comment on this?  I have a patch, but figured it'd be better for
> TI to provide an official solution.  Or is there another forum it
> should be raised in?
> 
> It's really misleading for the self-documenting device tree
> specifications to lie about what sort of slew is being configured.
> 
> Peter
> 
> On 09/06/2014 06:17 PM, Peter A. Bigot wrote:
> >While converting some old DTS bindings, I noticed that the Linux
> >include/dt-bindings/pinctrl/am33xx.h and am43xx.h headers both
> >define SLEWCTRL_FAST constants:
> >
> >include/dt-bindings/pinctrl/am33xx.h:#define SLEWCTRL_FAST
> >(1 << 6)
> >include/dt-bindings/pinctrl/am43xx.h:#define SLEWCTRL_FAST
> >(1 << 19)
> >
> >According to the TRM for these processors, the effect of setting
> >that bit is to select slow slew; fast would be selected by leaving
> >it cleared.  The constants should therefore be named
> >SLEWCTRL_SLOW.
> >
> >This is consistent with the value for the I2C binding constants
> >I'm converting:
> >
> >beagleboard/3.14:arch/arm/boot/dts/am335x-bone-common-pinmux.dtsi:
> >0x158 0x72      /* spi0_d1.i2c1_sda, SLEWCTRL_SLOW | INPUT_PULLUP
> >| MODE2 */
> >beagleboard/3.14:arch/arm/boot/dts/am335x-bone-common-pinmux.dtsi:
> >0x15c 0x72      /* spi0_cs0.i2c1_scl, SLEWCTRL_SLOW | INPUT_PULLUP
> >| MODE2 */
> >
> >except that in the official files we have something like:
> >
> >stable/linux-3.14.y:arch/arm/boot/dts/am43x-epos-evm.dts: 0x188
> >(PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)    /*
> >i2c0_sda.i2c0_sda */
> >stable/linux-3.14.y:arch/arm/boot/dts/am43x-epos-evm.dts: 0x18c
> >(PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)    /*
> >i2c0_scl.i2c0_scl */
> >
> >which is either wrong or misleading.
> >
> >Peter
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


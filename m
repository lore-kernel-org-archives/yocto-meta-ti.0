Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE740E0084D; Wed, 17 Sep 2014 05:17:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [173.201.192.103 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from p3plsmtpa06-02.prod.phx3.secureserver.net
	(p3plsmtpa06-02.prod.phx3.secureserver.net [173.201.192.103])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CD1FE00786
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 05:17:05 -0700 (PDT)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa06-02.prod.phx3.secureserver.net with 
	id sCH31o00K0BVjqb01CH39D; Wed, 17 Sep 2014 05:17:04 -0700
Message-ID: <54197BBF.6070004@pabigot.com>
Date: Wed, 17 Sep 2014 07:17:03 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <540B960B.6080907@pabigot.com>
In-Reply-To: <540B960B.6080907@pabigot.com>
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
X-List-Received-Date: Wed, 17 Sep 2014 12:17:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Any comment on this?  I have a patch, but figured it'd be better for TI 
to provide an official solution.  Or is there another forum it should be 
raised in?

It's really misleading for the self-documenting device tree 
specifications to lie about what sort of slew is being configured.

Peter

On 09/06/2014 06:17 PM, Peter A. Bigot wrote:
> While converting some old DTS bindings, I noticed that the Linux 
> include/dt-bindings/pinctrl/am33xx.h and am43xx.h headers both define 
> SLEWCTRL_FAST constants:
>
> include/dt-bindings/pinctrl/am33xx.h:#define 
> SLEWCTRL_FAST              (1 << 6)
> include/dt-bindings/pinctrl/am43xx.h:#define 
> SLEWCTRL_FAST              (1 << 19)
>
> According to the TRM for these processors, the effect of setting that 
> bit is to select slow slew; fast would be selected by leaving it 
> cleared.  The constants should therefore be named SLEWCTRL_SLOW.
>
> This is consistent with the value for the I2C binding constants I'm 
> converting:
>
> beagleboard/3.14:arch/arm/boot/dts/am335x-bone-common-pinmux.dtsi: 
> 0x158 0x72      /* spi0_d1.i2c1_sda, SLEWCTRL_SLOW | INPUT_PULLUP | 
> MODE2 */
> beagleboard/3.14:arch/arm/boot/dts/am335x-bone-common-pinmux.dtsi: 
> 0x15c 0x72      /* spi0_cs0.i2c1_scl, SLEWCTRL_SLOW | INPUT_PULLUP | 
> MODE2 */
>
> except that in the official files we have something like:
>
> stable/linux-3.14.y:arch/arm/boot/dts/am43x-epos-evm.dts: 0x188 
> (PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)    /* i2c0_sda.i2c0_sda */
> stable/linux-3.14.y:arch/arm/boot/dts/am43x-epos-evm.dts: 0x18c 
> (PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)    /* i2c0_scl.i2c0_scl */
>
> which is either wrong or misleading.
>
> Peter



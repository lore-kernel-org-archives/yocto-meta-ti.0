Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCE7BE0088A; Wed,  8 Oct 2014 16:55:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [68.178.252.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 92 seconds by postgrey-1.32 at yocto-www;
	Wed, 08 Oct 2014 16:55:26 PDT
Received: from p3plsmtpa11-08.prod.phx3.secureserver.net
	(p3plsmtpa11-08.prod.phx3.secureserver.net [68.178.252.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46340E00860
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 16:55:26 -0700 (PDT)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa11-08.prod.phx3.secureserver.net with 
	id 0nts1p0060BVjqb01ntsfn; Wed, 08 Oct 2014 16:53:53 -0700
Message-ID: <5435CE8F.3020500@pabigot.com>
Date: Wed, 08 Oct 2014 18:53:51 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <540B960B.6080907@pabigot.com> <54197BBF.6070004@pabigot.com>
	<20141007205837.GF25997@denix.org>
In-Reply-To: <20141007205837.GF25997@denix.org>
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
X-List-Received-Date: Wed, 08 Oct 2014 23:55:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Depends what "upstream" means.  It's not in 3.17 released 05 Oct, nor in 
any other non-TI repository I can find.  (Might be hidden in a TI 
repository somewhere that I'm not looking.)

Peter

On 10/07/2014 03:58 PM, Denys Dmytriyenko wrote:
> Wasn't this already fixed upstream?
>
> On Wed, Sep 17, 2014 at 07:17:03AM -0500, Peter A. Bigot wrote:
>> Any comment on this?  I have a patch, but figured it'd be better for
>> TI to provide an official solution.  Or is there another forum it
>> should be raised in?
>>
>> It's really misleading for the self-documenting device tree
>> specifications to lie about what sort of slew is being configured.
>>
>> Peter
>>
>> On 09/06/2014 06:17 PM, Peter A. Bigot wrote:
>>> While converting some old DTS bindings, I noticed that the Linux
>>> include/dt-bindings/pinctrl/am33xx.h and am43xx.h headers both
>>> define SLEWCTRL_FAST constants:
>>>
>>> include/dt-bindings/pinctrl/am33xx.h:#define SLEWCTRL_FAST
>>> (1 << 6)
>>> include/dt-bindings/pinctrl/am43xx.h:#define SLEWCTRL_FAST
>>> (1 << 19)
>>>
>>> According to the TRM for these processors, the effect of setting
>>> that bit is to select slow slew; fast would be selected by leaving
>>> it cleared.  The constants should therefore be named
>>> SLEWCTRL_SLOW.
>>>
>>> This is consistent with the value for the I2C binding constants
>>> I'm converting:
>>>
>>> beagleboard/3.14:arch/arm/boot/dts/am335x-bone-common-pinmux.dtsi:
>>> 0x158 0x72      /* spi0_d1.i2c1_sda, SLEWCTRL_SLOW | INPUT_PULLUP
>>> | MODE2 */
>>> beagleboard/3.14:arch/arm/boot/dts/am335x-bone-common-pinmux.dtsi:
>>> 0x15c 0x72      /* spi0_cs0.i2c1_scl, SLEWCTRL_SLOW | INPUT_PULLUP
>>> | MODE2 */
>>>
>>> except that in the official files we have something like:
>>>
>>> stable/linux-3.14.y:arch/arm/boot/dts/am43x-epos-evm.dts: 0x188
>>> (PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)    /*
>>> i2c0_sda.i2c0_sda */
>>> stable/linux-3.14.y:arch/arm/boot/dts/am43x-epos-evm.dts: 0x18c
>>> (PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)    /*
>>> i2c0_scl.i2c0_scl */
>>>
>>> which is either wrong or misleading.
>>>
>>> Peter
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>>



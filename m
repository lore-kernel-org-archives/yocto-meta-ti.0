Return-Path: <trini@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83EB4E004DD; Mon,  4 Aug 2014 09:57:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E9B5E0030B
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 09:57:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s74GvDLk027540;
	Mon, 4 Aug 2014 11:57:13 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s74GvD38032633;
	Mon, 4 Aug 2014 11:57:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 4 Aug 2014 11:57:12 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s74GvBMi026420;	Mon, 4 Aug 2014 11:57:12 -0500
Received: from [172.22.83.58] (j-172-22-83-58.vpn.ti.com [172.22.83.58])	by
	dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	s74Gv9V4025924;	Mon, 4 Aug 2014 22:27:10 +0530
Message-ID: <53DFBB6B.6060205@ti.com>
Date: Mon, 4 Aug 2014 12:57:15 -0400
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
References: <1407167150-22655-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20140804163855.GK19374@bill-the-cat>
	<20140804165343.GS3214@piout.net>
In-Reply-To: <20140804165343.GS3214@piout.net>
X-Enigmail-Version: 1.6
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Mon, 04 Aug 2014 16:57:19 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 08/04/2014 12:53 PM, Alexandre Belloni wrote:
> Hi,
> 
> On 04/08/2014 at 12:38:55 -0400, Tom Rini wrote :
>> On Mon, Aug 04, 2014 at 05:45:50PM +0200, Alexandre Belloni wrote:
>>
>>> Using the am335x_boneblack configuration for u-boot allows to save the
>>> environment to the emmc. Else, it is not possible to save the
>>> environment at all.
>>>
>>> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>>
>> There's two ways to go about improving the out of box experience.  One
>> of which would be to switch "beaglebone" to am335x_boneblack config
>> which will switch env saving to eMMC and leave BBW just as unable to
>> have persisent env (outside of uEnv.txt) as today.  Another would be to
>> bring in http://patchwork.ozlabs.org/patch/375824/ (which will be merged
>> to mainline) and
>> https://git.ti.com/ti-u-boot/ti-u-boot/commit/b8fce957880e6c4194614260f70be4e7f2c9f469
>> (which will not, we'll instead get env location migrated to Kconfig
>> choices and leave it to the user to pick where they want things to be)
>> which puts everything in a binary file on the FAT partition of the SD
>> card which is also pretty frequently available.
> 
> Do you have a branch with both patches applied? Or maybe it is simpler
> to wait for the first one to hit mainline and upgrade the u-boot recipe
> at that time.
> 
> I'm a bit concerned that the second patch will actually change the
> behaviour of the am335x_evm config, switching from reading the env in
> nand to that file in the first FAT partition. Do you want to change
> that?

In terms of general out of box experience, yes, I wanted to change
everyone over.  Of all the boards am335x_evm supports (GP EVM, IDK EVM,
EVM SK, BBW, BBB) only GP EVM and maybe IDK EVM (not seen one myself)
have NAND normally.  All of them have SD card support 'tho.

-- 
Tom


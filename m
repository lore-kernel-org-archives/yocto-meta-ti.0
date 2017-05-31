Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70591E00B01; Wed, 31 May 2017 10:33:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF5D8E00992
	for <meta-ti@yoctoproject.org>; Wed, 31 May 2017 10:33:56 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4VHXkLK010117
	for <meta-ti@yoctoproject.org>; Wed, 31 May 2017 12:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496252026;
	bh=BTezn2kB2cOuawyxHGFjBD/X2FbQtXs1e2p4TacfUhg=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=o9locTyp6Ubb+LgK/ViIKXelkmqLs/TxfFbL/bs4UJwOp6wd6WA/XJ7FTvLpPQrr1
	NeLTryOlNL7rsYBbRYk4hWimQvkH29BcvAwWJslisAjrkTrJwr9wrS22kV6XpqJFR8
	SHDVAeySITAOmkHwACIyfh1Ei7vDilU/BO+9gJPs=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4VHXfQX024245
	for <meta-ti@yoctoproject.org>; Wed, 31 May 2017 12:33:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 May 2017 12:33:41 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4VHXeDf008852;
	Wed, 31 May 2017 12:33:41 -0500
To: Denys Dmytriyenko <denys@ti.com>, "Pang, Ivan" <i-pang@ti.com>
References: <1496248865-13909-1-git-send-email-i-pang@ti.com>
	<d448e54f-e861-929c-648f-204b31f8b96f@ti.com>
	<20170531170143.GM28136@edge>
	<C45960711C772449A33A51ED1374F08A406207CC@DFLE08.ent.ti.com>
	<20170531172157.GN28136@edge>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <dd7843c8-c385-fd61-32fe-4681ca730f28@ti.com>
Date: Wed, 31 May 2017 13:33:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170531172157.GN28136@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] starterware-rtos: added recipe for RTOS starterware
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
X-List-Received-Date: Wed, 31 May 2017 17:33:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 5/31/2017 1:21 PM, Denys Dmytriyenko wrote:
> On Wed, May 31, 2017 at 01:20:30PM -0400, Pang, Ivan wrote:
>> On Wed, May 31, 2017 at 12:49:06PM -0400, Jacob Stiffler wrote:
>>>
>>> On 5/31/2017 12:41 PM, Ivan Pang wrote:
>>>> Signed-off-by: Ivan Pang <i-pang@ti.com>
>>>> ---
>>>>   recipes-bsp/starterware/starterware-rtos_git.bb | 46
>>>> +++++++++++++++++++++++++
>>>>   1 file changed, 46 insertions(+)
>>>>   create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bb
>>>>
>>>> diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb
>>>> b/recipes-bsp/starterware/starterware-rtos_git.bb
>>>> new file mode 100644
>>>> index 0000000..f831fb8
>>>> --- /dev/null
>>>> +++ b/recipes-bsp/starterware/starterware-rtos_git.bb
>>>> @@ -0,0 +1,46 @@
>>>> +LICENSE = "BSD-3-Clause"
>>>> +LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=35;md5=286cbb5dce3e348294b6b025cff969b3"
>>>> +
>>>> +COMPATIBLE_MACHINE = "ti33x|ti43x"
>>>> +DEPENDS = "gcc-arm-none-eabi-native"
>>>> +
>>>> +require recipes-ti/includes/ti-paths-append.inc
>>>        ^^^ This is not available in the meta-ti layer.
>> [Ivan] will change to ti-paths.inc and submit a PATCH v2
>>
>> BTW, is it any different from previous submission last week?
>> [Ivan] No, it's the same patch, but this time I included [meta-ti] in the
>> subject line as it was missing before.
> The list automatically adds that:
>
> https://lists.yoctoproject.org/pipermail/meta-ti/2017-May/009978.html

I did not receive this patch from the list.

>
>>>> +require recipes-ti/includes/ti-staging.inc
>>>> +
>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> +
>>>> +STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
>>>> +STARTERWARE_GIT_PROTOCOL = "git"
>>>> +STARTERWARE_GIT_BRANCH = "master"
>>>> +
>>>> +# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.02A"
>>>> +STARTERWARE_SRCREV = "d648ffc46a3508802ec5d4f70f3d0e8f970ce1fa"
>>>> +
>>>> +BRANCH = "${STARTERWARE_GIT_BRANCH}"
>>>> +SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
>>>> +
>>>> +SRCREV = "${STARTERWARE_SRCREV}"
>>>> +PV = "02.01.01.02A"
>>>> +PR = "r0"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +PARTNO_ti33x = "am335x"
>>>> +PARTNO_ti43x = "am437x"
>>>> +
>>>> +export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
>>>> +export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
>>>> +
>>>> +do_compile() {
>>>> +    cd build
>>>> +    ./release_${PARTNO}.sh
>>>> +}
>>>> +
>>>> +do_install() {
>>>> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware
>>>> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C
>>>> +${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/starterware \; }
>>>> +
>>>> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>>>> +
>>>> +INSANE_SKIP_${PN} = "arch staticdev"
>>> --
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti



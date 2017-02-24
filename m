Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9464E00510; Fri, 24 Feb 2017 11:08:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D31EE00405
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 11:08:27 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1OJ8RHN030003
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 13:08:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1OJ8Rh1021643
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 13:08:27 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 13:08:26 -0600
Received: from [172.22.133.194] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1OJ8Q0O007670;
	Fri, 24 Feb 2017 13:08:26 -0600
Message-ID: <58B084AA.2080400@ti.com>
Date: Fri, 24 Feb 2017 13:08:26 -0600
From: Dan Murphy <dmurphy@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1487472416-94956-1-git-send-email-denys@ti.com>
	<58AC9B39.9090606@ti.com> <20170223205007.GK26872@edge>
	<58AF4BE8.5080905@ti.com> <20170224184221.GR26872@edge>
In-Reply-To: <20170224184221.GR26872@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-ti.inc: k2e-hs-evm doesn't provide the same binaries as other KS2 devices
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
X-List-Received-Date: Fri, 24 Feb 2017 19:08:29 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Denys

On 02/24/2017 12:42 PM, Denys Dmytriyenko wrote:
> On Thu, Feb 23, 2017 at 02:54:00PM -0600, Dan Murphy wrote:
>> Denys
>>
>>
>> On 02/23/2017 02:50 PM, Denys Dmytriyenko wrote:
>>> On Tue, Feb 21, 2017 at 01:55:37PM -0600, Dan Murphy wrote:
>>>> Denys
>>>>
>>>> On 02/18/2017 08:46 PM, Denys Dmytriyenko wrote:
>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>>> ---
>>>>>  recipes-bsp/u-boot/u-boot-ti.inc | 35 ++++++++++++++++++++++-------------
>>>>>  1 file changed, 22 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> index 0c0b6e8..57f7fe6 100644
>>>>> --- a/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
>>>>> @@ -49,7 +49,6 @@ SPL_BINARY_omapl138 = ""
>>>>>  
>>>>>  # SPL (Second Program Loader) to be loaded over UART
>>>>>  SPL_UART_BINARY = "u-boot-spl.bin"
>>>>> -SPL_UART_BINARY_k2e-hs-evm = ""
>>>>>  SPL_UART_BINARY_keystone = ""
>>>>>  
>>>>>  SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-Mon: 16.30 - 17.00${MACHINE}-${PV}-${PR}"
>>>>> @@ -60,8 +59,10 @@ UBOOT_SUFFIX_keystone = "bin"
>>>>>  
>>>>>  # SPI NOR Flash binaries
>>>>>  UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
>>>>> +UBOOT_SPI_SPL_BINARY_k2e-hs-evm = ""
>>>>>  UBOOT_SPI_BINARY = "u-boot.img"
>>>>>  UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
>>>>> +UBOOT_SPI_GPH_BINARY_k2e-hs-evm = ""
>>>>>  
>>>>>  # SPI NOR Flash deployed images
>>>>>  UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
>>>>> @@ -126,29 +127,37 @@ do_deploy_append () {
>>>>>  }
>>>>>  
>>>>>  do_install_append_keystone () {
>>>>> -	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
>>>>> -	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
>>>>> +	if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
>>>> This won't work.  You are checking for the SPI SPL binary in the build directory then
>>>> try to install the binary from the spl directory.
>>> Not checking for the file at all here. The check is only to see if it's 
>>> enabled, not whether it exists.
>>>
>> OK right I misread that. but again if the SPI_SPL binary is defined then we attempt to
>> install from a directory we don't know exists or not.
>>
>> Maybe an AND case here to check the directory and whether the file is defined.
> I completely understand where you are coming from with this suggestion - it 
> would definitely reduce the number of failures if/when u-boot decides to 
> change what artifacts and where it deploys.
>
> On the other hand, here in u-boot-ti.inc I'm extending the standard 
> OpenEmbedded code from u-boot.inc for additional TI artifacts and following 
> the same coding standard. In many cases it is required for pre-defined 
> artifacts to exist and fail if they don't, instead of ignoring it and 
> continuing.
>

Thanks for the explanation

Reviewed-by: Dan Murphy<dmurphy@ti.com>

Dan

-- 
------------------
Dan Murphy



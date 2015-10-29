Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB636E00ABE; Thu, 29 Oct 2015 08:05:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B108FE00A28
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 08:05:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9TF5hvm000814
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 10:05:43 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9TF5hBo021556
	for <meta-ti@yoctoproject.org>; Thu, 29 Oct 2015 10:05:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Oct 2015 10:05:43 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9TF5gQK005426;
	Thu, 29 Oct 2015 10:05:43 -0500
Message-ID: <563235C7.5090108@ti.com>
Date: Thu, 29 Oct 2015 11:05:43 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1446121633-4283-1-git-send-email-j-stiffler@ti.com>
	<1446121633-4283-2-git-send-email-j-stiffler@ti.com>
	<20151029144604.GC8780@edge>
In-Reply-To: <20151029144604.GC8780@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] pru-icss: Add PRU software package version 4.0.0.0
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
X-List-Received-Date: Thu, 29 Oct 2015 15:05:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/29/2015 10:46 AM, Denys Dmytriyenko wrote:
> On Thu, Oct 29, 2015 at 08:27:13AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   recipes-bsp/pru/pru-icss_git.bb | 69 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>   create mode 100644 recipes-bsp/pru/pru-icss_git.bb
>>
>> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
>> new file mode 100644
>> index 0000000..2e90b65
>> --- /dev/null
>> +++ b/recipes-bsp/pru/pru-icss_git.bb
>> @@ -0,0 +1,69 @@
>> +DESCRIPTION = "Programmable Real-time Unit Software Package"
>> +HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
>> +LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
>> +
>> +LIC_FILES_CHKSUM = "file://PRU-Package-v4.0-Manifest.html;md5=5ea937e4ff2c924a735d42e61ad8cbe3"
>> +
>> +BRANCH = "master"
>> +SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
>> +SRCREV = "476289eb7c3a91977bae84aea55c56f3120b48ea"
>> +
>> +BASE_PV = "4.0.0.0"
> Do you need this defined? I don't see it being used.

I was going to use this when creating the sourceipk. It is desired to 
not have the commit id fragment in the destination sourceipk location. I 
suppose I could just drop the SRCPV from the PV.

>
>> +PV = "${BASE_PV}+git${SRCPV}"
>> +PR = "r0"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +DEPENDS = "ti-cgt-pru-native"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +export PRU_CGT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-pru"
> require ti-paths.inc
> export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"

Thanks for pointing this out. I missed this when bringing the recipe 
over from meta-processor-sdk.

>
>> +
>> +SUBDIRS = "examples pru_cape/pru_fw lib/src labs"
>> +
>> +do_compile() {
>> +    for dir in ${SUBDIRS}
>> +    do
>> +        make -C ${S}/$dir
>> +    done
>> +}
> Does it build all the example FW images for all platforms, or are those
> already prebuilt?

This rebuilds all of the example firmware for all platforms.

>
>> +# By default, do not install anything
>> +do_install() {
>> +    :
>> +}
>> +
>> +do_install_am335x-evm() {
>> +    install -d ${D}/lib/firmware
>> +    for i in 0 1
>> +    do
>> +        install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
>> +                        ${D}/lib/firmware/am335x-pru${i}-fw
>> +    done
>> +}
>> +
>> +do_install_am437x-evm() {
>> +    install -d ${D}/lib/firmware
>> +    for i in 0 1
>> +    do
>> +        install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
>> +                        ${D}/lib/firmware/am437x-pru1_${i}-fw
>> +    done
>> +}
>> +
>> +do_install_am57xx-evm() {
>> +    install -d ${D}/lib/firmware
>> +    for i in 1 2
>> +    do
>> +        for j in 0 1
>> +        do
>> +            install -m 0644 ${S}/examples/am572x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
>> +                            ${D}/lib/firmware/am57xx-pru${i}_${j}-fw
>> +        done
>> +    done
>> +}
> What about PRU-less platforms? You don't set COMPATIBLE_MACHINE, so for
> example KS2 will try to build something, but won't install anything. Do we
> want to prevent that?

That makes sense. I will add this.

>
>> +FILES_${PN} += "/lib/firmware"
>> +
>> +INSANE_SKIP_${PN} = "arch"
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti



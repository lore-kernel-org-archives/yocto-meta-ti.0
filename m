Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A457DE009AD; Mon,  1 Jun 2015 05:54:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EE84E00547
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 05:54:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51CsLPk016347
	for <meta-ti@yoctoproject.org>; Mon, 1 Jun 2015 07:54:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51CsLWA012553
	for <meta-ti@yoctoproject.org>; Mon, 1 Jun 2015 07:54:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 07:54:21 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51CsLbN028350;
	Mon, 1 Jun 2015 07:54:21 -0500
Message-ID: <556C55FD.6020800@ti.com>
Date: Mon, 1 Jun 2015 08:54:21 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
	<1432735838-7207-5-git-send-email-j-stiffler@ti.com>
	<20150529201043.GE16418@edge>
In-Reply-To: <20150529201043.GE16418@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/4] common-csl-ip-rtos: Add CSL RTOS package.
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
X-List-Received-Date: Mon, 01 Jun 2015 12:54:24 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 5/29/2015 4:10 PM, Denys Dmytriyenko wrote:
> Ack
>
> Are all the dependencies ready for this?

Yes.

> Should all the files be added to ${PN}-dev?
>

And yes. If there are no other comments, I'll submit a v2 to add these 
files to the dev package.

> On Wed, May 27, 2015 at 10:10:38AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../common-csl-ip/common-csl-ip-rtos_git.bb        |   33 ++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>   create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
>>
>> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
>> new file mode 100644
>> index 0000000..5d4a552
>> --- /dev/null
>> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
>> @@ -0,0 +1,33 @@
>> +require common-csl-ip.inc
>> +
>> +require recipes-ti/includes/ti-paths.inc
>> +require recipes-ti/includes/ti-staging.inc
>> +
>> +DEPENDS = "ti-xdctools ti-cgt6x-native ti-sysbios"
>> +
>> +S = "${WORKDIR}/ti/csl"
>> +
>> +export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr"
>> +export XDCCGROOT="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
>> +export XDCPATH="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
>> +
>> +do_configure() {
>> +    sed -i "s/\ \"\.\\\\\\\\\"\ +//" src/Module.xs
>> +    find -name "*.xs" -exec sed -i "s/ofd6x\.exe/ofd6x/" {} \;
>> +    find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
>> +    find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
>> +    find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
>> +}
>> +
>> +do_compile() {
>> +    ${XDC_INSTALL_DIR}/xdc .make
>> +    ${XDC_INSTALL_DIR}/xdc clean
>> +    ${XDC_INSTALL_DIR}/xdc release
>> +}
>> +
>> +do_install () {
>> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
>> +    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages \;
>> +}
>> +
>> +FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti



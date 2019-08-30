Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2034DE00E0D; Fri, 30 Aug 2019 09:26:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E611E0082A
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 09:26:52 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGQpsP076425
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567182411;
	bh=mAzBtJUuP03by4x19T5X9r0Ds02j3py2RJsaSMcsoMI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=QyLtTZA/yhPJdTsHt45z+5kKA7u4szFv0Tz1AwFLimsSuFwwYLAh9xTxZD1U3R768
	Bp7jNFnhcXWIKW3w95zjgIUT/ItjwCdUPeJvL1p2EPSJTADg6LY515bwYIsStdlvUy
	TCjM9nIcu63QKHluFEoL8W/ri38/0Hf6cGls3nN4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGQpP6052494
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:26:51 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:26:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:26:51 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGQouK115830;
	Fri, 30 Aug 2019 11:26:51 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <a0132237@ti.com>
References: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
	<1566324672-29395-3-git-send-email-j-stiffler@ti.com>
	<2bb8f813-ad8e-028d-f9c6-e26c1d685458@ti.com>
	<20190830162351.GF3307@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8a6fc1fb-0a70-d837-14c5-482545940588@ti.com>
Date: Fri, 30 Aug 2019 12:26:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830162351.GF3307@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, lokeshvutla@ti.com
Subject: Re: [master/thud][PATCH v2 3/3] jailhouse: use ramfs for linux-demo
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
X-List-Received-Date: Fri, 30 Aug 2019 16:26:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/30/2019 12:23 PM, Denys Dmytriyenko wrote:
> On Thu, Aug 29, 2019 at 02:21:51PM +0530, Nikhil Devshatwar wrote:
>> On 20/08/19 11:41 PM, Jacob Stiffler wrote:
>>> * Configure the linux-demo to use a ramfs for the linux inmate.
>>> * Using JH_RAMFS_IMAGE, this can be set in some global conf.
>>>
>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> Tested-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> I manually built the core-image-minimal in cpio format with a bbappend of my own.
>> How is this supposed to be built automatically?
>>
>> Can you add a depends variable so that the build kicks automatically?
> There's a proper DEPENDS being added in the anonymous function below, so
> should work automatically.


We do not have "cpio" in our IMAGE_TYPES, so it needs to be added for 
JH_RAMFS_IMAGE.

I cannot think of a way to force that IMAGE_TYPE from this recipe, but 
is there a way?


> Denys
>
>
>> Nikhil D
>>
>>> ---
>>>   recipes-kernel/jailhouse/jailhouse_git.bb | 21 +++++++++++++++++----
>>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
>>> index 5d572d0..ba6772f 100644
>>> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
>>> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
>>> @@ -58,8 +58,10 @@ JH_SYSCONFIG_CELL ?= ""
>>>   JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
>>>   JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
>>> +JH_RAMFS_IMAGE ?= "core-image-minimal"
>>> +
>>>   JH_CMDLINE ?= ""
>>> -JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
>>> +JH_CMDLINE_k3 ?= "console=ttyS1,115200n8"
>>>   do_configure() {
>>>   	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
>>> @@ -101,6 +103,16 @@ do_install() {
>>>   	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
>>>   	install -d ${D}/boot
>>> +	if [ -n "${JH_RAMFS_IMAGE}" ]
>>> +	then
>>> +		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
>>> +		then
>>> +			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
>>> +		else
>>> +			bbwarn "Could find find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
>>> +			bbwarn "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
>>> +		fi
>>> +	fi
>>>   	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
>>>   		cd ${TOOLS_SRC_DIR}
>>> @@ -110,6 +122,7 @@ do_install() {
>>>   		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
>>>   			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
>>>   			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
>>> +			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
>>>   			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
>>>   			${DEPLOY_DIR_IMAGE}/Image \
>>>   			| tr -cd '\11\12\15\40-\176' \
>>> @@ -143,9 +156,9 @@ CELLS = ""
>>>   python __anonymous () {
>>>       d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
>>> -    initrd = d.getVar('INITRAMFS_IMAGE', True)
>>> -    if initrd:
>>> -        d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
>>> +    ramfs = d.getVar('JH_RAMFS_IMAGE', True)
>>> +    if ramfs:
>>> +        d.appendVarFlag('do_install', 'depends', ' ${JH_RAMFS_IMAGE}:do_image_complete')
>>>       # Setup DEPENDS and RDEPENDS to included cells
>>>       cells = d.getVar('CELLS', True) or ""
>>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


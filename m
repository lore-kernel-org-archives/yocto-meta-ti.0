Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0751E00C46; Fri, 30 Aug 2019 09:54:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02BDFE00BFF
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 09:54:00 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGs0Vf082475
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567184040;
	bh=2OQ5bqA3OZeLJzNlfW4dkgOGmK2QdyPCRWEjGA1IO74=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=y4ZoqQP+2rnIY9wGbKaqckllUQ8iFwO9heykrmHq+lM1ClWxGYxN/6OFQ7UkgPnyk
	CHZkNFDvlNju6rH7EYH90b8gWmjWg0EOjbMzt2n9i5pYaNXkoee1PK3GRC30VUQpKB
	jwpd4LMSnJFUFhY4VJY5M5JprHg+2J7xX3F4r4fw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGs0AU084778
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 30 Aug 2019 11:54:00 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:53:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:53:59 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGrxNU023922;
	Fri, 30 Aug 2019 11:53:59 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1566324672-29395-1-git-send-email-j-stiffler@ti.com>
	<1566324672-29395-3-git-send-email-j-stiffler@ti.com>
	<2bb8f813-ad8e-028d-f9c6-e26c1d685458@ti.com>
	<20190830162351.GF3307@beryl>
	<8a6fc1fb-0a70-d837-14c5-482545940588@ti.com>
	<20190830163149.GH3307@beryl>
	<7c3d6ae7-6db7-0158-32f1-be387b02a9c7@ti.com>
	<20190830165028.GI3307@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f549cd25-577a-2942-fa7d-29a59ea0c967@ti.com>
Date: Fri, 30 Aug 2019 12:53:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830165028.GI3307@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, lokeshvutla@ti.com,
	Nikhil Devshatwar <a0132237@ti.com>
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
X-List-Received-Date: Fri, 30 Aug 2019 16:54:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/30/2019 12:50 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 30, 2019 at 12:42:32PM -0400, Jacob Stiffler wrote:
>> On 8/30/2019 12:31 PM, Denys Dmytriyenko wrote:
>>> On Fri, Aug 30, 2019 at 12:26:51PM -0400, Jacob Stiffler wrote:
>>>> On 8/30/2019 12:23 PM, Denys Dmytriyenko wrote:
>>>>> On Thu, Aug 29, 2019 at 02:21:51PM +0530, Nikhil Devshatwar wrote:
>>>>>> On 20/08/19 11:41 PM, Jacob Stiffler wrote:
>>>>>>> * Configure the linux-demo to use a ramfs for the linux inmate.
>>>>>>> * Using JH_RAMFS_IMAGE, this can be set in some global conf.
>>>>>>>
>>>>>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>>>>> Tested-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>
>>>>>> I manually built the core-image-minimal in cpio format with a bbappend of my own.
>>>>>> How is this supposed to be built automatically?
>>>>>>
>>>>>> Can you add a depends variable so that the build kicks automatically?
>>>>> There's a proper DEPENDS being added in the anonymous function below, so
>>>>> should work automatically.
>>>> We do not have "cpio" in our IMAGE_TYPES, so it needs to be added for
>>>> JH_RAMFS_IMAGE.
>>>>
>>>> I cannot think of a way to force that IMAGE_TYPE from this recipe, but is
>>>> there a way?
>>> No, the only way is to check that IMAGE_FSTYPES contains "cpio" when
>>> JH_RAMFS_IMAGE is set and error out otherwise. Can be done in anonymous
>>> function to bail out early and not wait until JH builds.
>>>
>> But cpio can be added as a recipe override, so preemptively detecting this
>> could get tricky.
> All the overrides should be parsed and processed by the time anonymous
> functions are executed... Is there a specific use-case you have that doesn't
> work?


If you only want cpio for the JH_RAMFS_IMAGE. For example, in some conf 
file:

IMAGE_FSTYPES = "tar.xz"

IMAGE_FSTYPES_append_pn-${JH_RAMFS_IMAGE} = " cpio"


The jailhouse recipe will incorrectly throw an error.

>
>>>>> Denys
>>>>>
>>>>>
>>>>>> Nikhil D
>>>>>>
>>>>>>> ---
>>>>>>>   recipes-kernel/jailhouse/jailhouse_git.bb | 21 +++++++++++++++++----
>>>>>>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
>>>>>>> index 5d572d0..ba6772f 100644
>>>>>>> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
>>>>>>> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
>>>>>>> @@ -58,8 +58,10 @@ JH_SYSCONFIG_CELL ?= ""
>>>>>>>   JH_SYSCONFIG_CELL_am65xx ?= "k3-am654-idk.cell"
>>>>>>>   JH_SYSCONFIG_CELL_j7-evm ?= "k3-j721e-evm.cell"
>>>>>>> +JH_RAMFS_IMAGE ?= "core-image-minimal"
>>>>>>> +
>>>>>>>   JH_CMDLINE ?= ""
>>>>>>> -JH_CMDLINE_k3 ?= "console=ttyS1,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait"
>>>>>>> +JH_CMDLINE_k3 ?= "console=ttyS1,115200n8"
>>>>>>>   do_configure() {
>>>>>>>   	if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
>>>>>>> @@ -101,6 +103,16 @@ do_install() {
>>>>>>>   	install -m 0644 ${B}/inmates/demos/${JH_ARCH}/*.bin ${D}${INMATES_DIR}
>>>>>>>   	install -d ${D}/boot
>>>>>>> +	if [ -n "${JH_RAMFS_IMAGE}" ]
>>>>>>> +	then
>>>>>>> +		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
>>>>>>> +		then
>>>>>>> +			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
>>>>>>> +		else
>>>>>>> +			bbwarn "Could find find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
>>>>>>> +			bbwarn "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
>>>>>>> +		fi
>>>>>>> +	fi
>>>>>>>   	if [ -n "${JH_INMATE_DTB}" -a -n "${JH_LINUX_DEMO_CELL}" ]; then
>>>>>>>   		cd ${TOOLS_SRC_DIR}
>>>>>>> @@ -110,6 +122,7 @@ do_install() {
>>>>>>>   		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
>>>>>>>   			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
>>>>>>>   			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
>>>>>>> +			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
>>>>>>>   			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
>>>>>>>   			${DEPLOY_DIR_IMAGE}/Image \
>>>>>>>   			| tr -cd '\11\12\15\40-\176' \
>>>>>>> @@ -143,9 +156,9 @@ CELLS = ""
>>>>>>>   python __anonymous () {
>>>>>>>       d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
>>>>>>> -    initrd = d.getVar('INITRAMFS_IMAGE', True)
>>>>>>> -    if initrd:
>>>>>>> -        d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
>>>>>>> +    ramfs = d.getVar('JH_RAMFS_IMAGE', True)
>>>>>>> +    if ramfs:
>>>>>>> +        d.appendVarFlag('do_install', 'depends', ' ${JH_RAMFS_IMAGE}:do_image_complete')
>>>>>>>       # Setup DEPENDS and RDEPENDS to included cells
>>>>>>>       cells = d.getVar('CELLS', True) or ""
>>>>>>>
>>>>>> -- 
>>>>>> _______________________________________________
>>>>>> meta-ti mailing list
>>>>>> meta-ti@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-ti


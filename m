Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 232BEE00A44; Thu, 22 May 2014 13:38:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90660E00975
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 13:38:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MKcIGE025375
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 15:38:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MKcI7u021152
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 15:38:18 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 22 May 2014 15:38:18 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCHv3 4/4] linux-ti-staging: Add version 3.15 of
	TI integration kernel
Thread-Index: AQHPdfu5GFb3/PGOzUqu0ym+m2Bi3ZtNDxag
Date: Thu, 22 May 2014 20:38:17 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D050ADF@DLEE11.ent.ti.com>
References: <1400789313-13523-1-git-send-email-Chase.Maupin@ti.com>
	<1400789313-13523-2-git-send-email-Chase.Maupin@ti.com>
	<20140522202340.GQ21819@edge>
In-Reply-To: <20140522202340.GQ21819@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCHv3 4/4] linux-ti-staging: Add version 3.15 of TI integration kernel
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
X-List-Received-Date: Thu, 22 May 2014 20:38:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Thursday, May 22, 2014 3:24 PM
>To: Maupin, Chase
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCHv3 4/4] linux-ti-staging: Add version
>3.15 of TI integration kernel
>
>On Thu, May 22, 2014 at 03:08:33PM -0500, Chase Maupin wrote:
>> * Add version 3.15 of the TI integration kernel.  Major changes
>>   from previous version are:
>>     * Config fragments now come primarily from the integration
>>       tree.  Removed baseport and connectivity fragments for now
>>       and the others can be removed as they are added to the
>>       integration tree.
>>     * Added a non-smp.cfg config to disable SMP for single core
>>       devices instead of using a patch to the defconfig file as
>>       we did in the past.
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>
>> ---
>> * Updated in version 2
>>     * Change the default config fragements location
>>
>> * Updated in version 3
>>     * Use absolute paths in the config fragment names
>> ---
>>  .../defconfig                                      |    0
>>  .../ipc.cfg                                        |    0
>>  .../linux/linux-ti-staging-3.15/non-smp.cfg        |    5 +++++
>>  .../systest.cfg                                    |    0
>>  ...ti-staging_3.12.bb =3D> linux-ti-staging_3.15.bb} |   21
>+++++++++-----------
>>  5 files changed, 14 insertions(+), 12 deletions(-)
>>  copy recipes-kernel/linux/{linux-mainline =3D> linux-ti-staging-
>3.15}/defconfig (100%)
>>  copy recipes-kernel/linux/{linux-ti-staging-3.12 =3D> linux-ti-
>staging-3.15}/ipc.cfg (100%)
>>  create mode 100644 recipes-kernel/linux/linux-ti-staging-
>3.15/non-smp.cfg
>>  copy recipes-kernel/linux/{linux-ti-staging-3.12 =3D> linux-ti-
>staging-3.15}/systest.cfg (100%)
>>  copy recipes-kernel/linux/{linux-ti-staging_3.12.bb =3D> linux-
>ti-staging_3.15.bb} (73%)
>>
>> diff --git a/recipes-kernel/linux/linux-mainline/defconfig
>b/recipes-kernel/linux/linux-ti-staging-3.15/defconfig
>> similarity index 100%
>> copy from recipes-kernel/linux/linux-mainline/defconfig
>> copy to recipes-kernel/linux/linux-ti-staging-3.15/defconfig
>> diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
>b/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
>> similarity index 100%
>> copy from recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
>> copy to recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
>> diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/non-
>smp.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
>> new file mode 100644
>> index 0000000..d61a413
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
>> @@ -0,0 +1,5 @@
>> +##################################################
>> +# Non-SMP config options
>> +##################################################
>> +CONFIG_SMP=3Dn
>> +CONFIG_NR_CPUS=3Dn
>> diff --git a/recipes-kernel/linux/linux-ti-staging-
>3.12/systest.cfg b/recipes-kernel/linux/linux-ti-staging-
>3.15/systest.cfg
>> similarity index 100%
>> copy from recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg
>> copy to recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
>> diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb
>b/recipes-kernel/linux/linux-ti-staging_3.15.bb
>> similarity index 73%
>> copy from recipes-kernel/linux/linux-ti-staging_3.12.bb
>> copy to recipes-kernel/linux/linux-ti-staging_3.15.bb
>> index 5c4d669..fee67ce 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
>> @@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-dtb.inc
>>  require recipes-kernel/linux/setup-defconfig.inc
>>
>>  # Look in the generic major.minor directory for files
>> -FILESEXTRAPATHS_append :=3D "${THISDIR}/${PN}-3.12:"
>> +FILESEXTRAPATHS_append :=3D "${THISDIR}/${PN}-3.15:"
>>
>>  # Pull in the devicetree files into the rootfs
>>  RDEPENDS_kernel-base +=3D "kernel-devicetree"
>> @@ -37,26 +37,23 @@ COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> -BRANCH =3D "ti-linux-3.12.y"
>> +BRANCH =3D "ti-linux-3.15.y"
>>
>>  SRCREV =3D "f0d4672333685697320f4907d5b4d3919121c299"
>> -PV =3D "3.12.17"
>> +PV =3D "3.14+3.15-rc6"
>>
>>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will
>cause a rebuild
>> -MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>> +MACHINE_KERNEL_PR_append =3D "c+gitr${SRCPV}"
>>  PR =3D "${MACHINE_KERNEL_PR}"
>>
>> -KERNEL_CONFIG_FRAGMENTS =3D "${WORKDIR}/baseport.cfg
>${WORKDIR}/connectivity.cfg \
>> -                           ${WORKDIR}/ipc.cfg"
>> +KERNEL_CONFIG_DIR =3D "ti_config_fragments"
>
>So, where this directory is meant to be? The last patch assumed it
>was in
>arch/arm/configs... Or did I miss v2 of the patch?

There will be configs in the ti_config_fragments in the base of the kernel =
tree.  Those are being merged in over the next couple of days.  Then we can=
 add ${KERNEL_CONFIG_DIR}/connnectivity.cfg, etc.

So I left this directory here because I plan to use it soon but it isn't us=
ed right now.

>
>
>> +KERNEL_CONFIG_FRAGMENTS =3D "${WORKDIR}/ipc.cfg"
>> +KERNEL_CONFIG_FRAGMENTS_append_ti33x =3D "${WORKDIR}/non-smp.cfg"
>> +KERNEL_CONFIG_FRAGMENTS_append_ti43x =3D "${WORKDIR}/non-smp.cfg"
>>
>>  SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>>             file://defconfig \
>> -           file://baseport.cfg \
>> -           file://connectivity.cfg \
>>             file://ipc.cfg \
>>             file://systest.cfg \
>> +           file://non-smp.cfg \
>>            "
>> -
>> -# Disable SMP in defconfig on single-core platforms to reduce
>overhead
>> -SRC_URI_append_ti33x =3D "file://0001-Not-for-merge-ARM-config-
>omap-Disable-SMP-for-AM335x.patch"
>> -SRC_URI_append_ti43x =3D "file://0001-Not-for-merge-ARM-config-
>omap-Disable-SMP-for-AM335x.patch"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


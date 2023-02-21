Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BFEC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 18:27:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.50657.1677004037071444262
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 10:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EzneNxha;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31LIRB7W105674;
	Tue, 21 Feb 2023 12:27:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677004031;
	bh=fU/+CSk7XRft+nfK+x8+ViTfzo/8ZoPNFvZvfzQ9lQ4=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=EzneNxhaaZxOQDApQJ6FRMYHqHhmnWYcT5BxRkCo/H5JLRkebLhYcBZGQIi7QVZ9/
	 /iQw1bq0QK0Bc7rwpc18hS1nM/AgdSG14fZoVKZsQ6MVaaARgAGYDa7/EqkGlv3HAk
	 tsWbHIAdmuaZvAQuMGayXcRhgkQWwuiH26fAqm2w=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31LIRBBD028671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Feb 2023 12:27:11 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Feb 2023 12:27:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Feb 2023 12:27:11 -0600
Received: from res-desktop (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31LIRAYl050593;
	Tue, 21 Feb 2023 12:27:10 -0600
Date: Tue, 21 Feb 2023 12:27:04 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH v7 1/3] meta-ti-bsp:
 graphics: Resolve dependency chain
To: Denys Dmytriyenko <denis@denix.org>
CC: Jose Quaresma <quaresma.jose@gmail.com>, <denys@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <afd@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <k-bhargav@ti.com>
Message-ID: <4L0GQR.OH649BQST1VF3@ti.com>
In-Reply-To: <20230221032115.GO22689@denix.org>
References: <20230130232007.2393097-1-rs@ti.com>
	<20230130232007.2393097-2-rs@ti.com>
	<CANPvuRkm6pxPOuchL0cwLkk-dx35PeMB8euNu7vRnsuSDFzZ2Q@mail.gmail.com>
	<20230221032115.GO22689@denix.org>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-suRRv5NEg9+vU2UptaLV"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 18:27:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15895

--=-suRRv5NEg9+vU2UptaLV
Content-Type: text/plain; charset="us-ascii"; format=flowed

On Mon, Feb 20 2023 at 22:21:15 -05:00:00, Denys Dmytriyenko 
<denis@denix.org> wrote:
> 
>>  > diff --git 
>> a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
>>  > b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
>>  > new file mode 100644
>>  > index 00000000..912e9e9d
>>  > --- /dev/null
>>  > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
>>  > @@ -0,0 +1 @@
>>  > +require ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>_any('PREFERRED_PROVIDER_virtual/gpudriver',
>>  > 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
>>  > diff --git 
>> a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
>>  > b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
>>  > new file mode 100644
>>  > index 00000000..912e9e9d
>>  > --- /dev/null
>>  > +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
>>  > @@ -0,0 +1 @@
>>  > +require ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>_any('PREFERRED_PROVIDER_virtual/gpudriver',
>>  > 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
>>  > diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
>>  > b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
>>  > new file mode 100644
>>  > index 00000000..17edee8d
>>  > --- /dev/null
>>  > +++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
>>  > @@ -0,0 +1,40 @@
>>  > +# PowerVR Graphics require several patches that have not made 
>> their way
>>  > +# upstream yet. This allows us to build the shims we need without
>>  > completely
>>  > +# clobbering mesa.
>>  > +
>>  > +BRANCH = "powervr/kirkstone/22.0"
>>  > +
>>  > +SRC_URI = " \
>>  > +    git://
>>  > 
>> gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH}
>>  > 
>> <<http://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=$%7BBRANCH%7D>>
>>  > \
>>  > +
>>  > 
>> file://0001-meson.build-check-for-all-linux-host_os-combinations.patch 
>> <file://0001-meson.build-check-for-all-linux-host_os-combinations.patch/> 
>> \
>>  > +    file://0002-meson.build-make-TLS-ELF-optional.patch 
>> <file://0002-meson.build-make-tls-elf-optional.patch/> \
>>  > +    
>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch 
>> <file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch/> \
>>  > +    
>> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch 
>> <file://0001-futex.h-define-__nr_futex-if-it-does-not-exist.patch/> \
>>  > +    file://0001-util-format-Check-for-NEON-before-using-it.patch 
>> <file://0001-util-format-check-for-neon-before-using-it.patch/> \
>>  > +
>>  > 
>> file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch 
>> <file://0001-revert-egl-wayland-deprecate-drm_handle_format-and-d.patch/> 
>> \
>>  > +"
>>  >
>> 
>>  Having here all the patches in oe-core will stop working if someone 
>> changes
>>  the main recipe.
>>  This already happens in the master branch of oe-core.
>> 
>>  IMO If these patches are needed they should be merged on the ti 
>> fork branch.
> 
> The same exact comment was already provided offline in the past, 
> along with
> a number of others, and there was supposed to be v8 coming... Not 
> sure what
> happened and why unmodified v7 got merged...

That's my bad. Got tunnel vision trying to get SGX opperational and 
forgot about some of the suggested changes for v8. I'll submit a patch 
to resolve that when I get SGX opperational. I believe the solution 
that seemed most applicable was to drop the patch commit and instead 
use the patch paths from oe-core directly.

We didn't want to carry those patches in mesa since some of those are 
backports and distribution specific hacks for packaging. I want to keep 
mesa as vanilla as possible for multi-distro.


--=-suRRv5NEg9+vU2UptaLV
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto">On Mon, Feb 20 2023 at 22:21:15 -05:00:00, Denys Dmytriyenko &lt;denis@denix.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
<blockquote> &gt; diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
 &gt; b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
 &gt; new file mode 100644
 &gt; index 00000000..912e9e9d
 &gt; --- /dev/null
 &gt; +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbappend
 &gt; @@ -0,0 +1 @@
 &gt; +require <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>_any('PREFERRED_PROVIDER_virtual/gpudriver',
 &gt; 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
 &gt; diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 &gt; b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 &gt; new file mode 100644
 &gt; index 00000000..912e9e9d
 &gt; --- /dev/null
 &gt; +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappend
 &gt; @@ -0,0 +1 @@
 &gt; +require <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>_any('PREFERRED_PROVIDER_virtual/gpudriver',
 &gt; 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-mesa.inc', '', d)}
 &gt; diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
 &gt; b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
 &gt; new file mode 100644
 &gt; index 00000000..17edee8d
 &gt; --- /dev/null
 &gt; +++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
 &gt; @@ -0,0 +1,40 @@
 &gt; +# PowerVR Graphics require several patches that have not made their way
 &gt; +# upstream yet. This allows us to build the shims we need without
 &gt; completely
 &gt; +# clobbering mesa.
 &gt; +
 &gt; +BRANCH = "powervr/kirkstone/22.0"
 &gt; +
 &gt; +SRC_URI = " \
 &gt; +    git://
 &gt; gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=${BRANCH}
 &gt; &lt;<a href="http://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=$%7BBRANCH%7D">http://gitlab.freedesktop.org/StaticRocket/mesa.git;protocol=https;branch=$%7BBRANCH%7D</a>&gt;
 &gt; \
 &gt; +
 &gt; <a href="file://0001-meson.build-check-for-all-linux-host_os-combinations.patch">file://0001-meson.build-check-for-all-linux-host_os-combinations.patch</a> \
 &gt; +    <a href="file://0002-meson.build-make-TLS-ELF-optional.patch">file://0002-meson.build-make-TLS-ELF-optional.patch</a> \
 &gt; +    <a href="file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch</a> \
 &gt; +    <a href="file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch">file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch</a> \
 &gt; +    <a href="file://0001-util-format-Check-for-NEON-before-using-it.patch">file://0001-util-format-Check-for-NEON-before-using-it.patch</a> \
 &gt; +
 &gt; <a href="file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch">file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch</a> \
 &gt; +"
 &gt;
 
 Having here all the patches in oe-core will stop working if someone changes
 the main recipe.
 This already happens in the master branch of oe-core.
 
 IMO If these patches are needed they should be merged on the ti fork branch.
</blockquote>
The same exact comment was already provided offline in the past, along with 
a number of others, and there was supposed to be v8 coming... Not sure what 
happened and why unmodified v7 got merged...
</div></blockquote><div><br></div><div>That's my bad. Got tunnel vision trying to get SGX opperational and forgot about some of the suggested changes for v8. I'll submit a patch to resolve that when I get SGX opperational. I believe the solution that seemed most applicable was to drop the patch commit and instead use the patch paths from oe-core directly.</div><div><br></div><div>We didn't want to carry those patches in mesa since some of those are backports and distribution specific hacks for packaging. I want to keep mesa as vanilla as possible for multi-distro.</div></div>
--=-suRRv5NEg9+vU2UptaLV--


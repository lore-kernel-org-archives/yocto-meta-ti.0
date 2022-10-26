Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83591FA373E
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 15:53:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9236.1666799593424002664
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 08:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JCYSi9P6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29QFrAPd105131;
	Wed, 26 Oct 2022 10:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666799590;
	bh=+rZ6u4H5lVP432mpjKBvzmRL6Yl8kkbgvhUIUXMTCxs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=JCYSi9P6o3pBTwKOKfArCpD11XVjDfdJZUQQFergozCz+tf9mvpv1UKFFmkYbvN7u
	 esYZoiXCk3eistb2oLkK7PwU7NvfMbvO384r5H28/+rBdzq125Al0WN+XvCv0ylu+b
	 3lb7Wx4THSuqHwGnX7m3vMeXmNE+bTUYbOQQL9CY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29QFrAU4000663
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Oct 2022 10:53:10 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 26
 Oct 2022 10:53:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 26 Oct 2022 10:53:10 -0500
Received: from [10.250.34.50] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29QFrA3u029412;
	Wed, 26 Oct 2022 10:53:10 -0500
Message-ID: <b64ad5ba-a3cf-d2db-ded1-fa2f03b13f27@ti.com>
Date: Wed, 26 Oct 2022 10:53:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
Content-Language: en-US
To: Paul Barker <paul.barker@sancloud.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
 <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
 <b6f24527-2e5f-ec26-f1d4-8735183d3aad@sancloud.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <b6f24527-2e5f-ec26-f1d4-8735183d3aad@sancloud.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 15:53:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15207

On 10/25/22 9:08 AM, Paul Barker wrote:
> Hi Andrew,
> 
> On 17/10/2022 15:30, Andrew Davis wrote:
>> I'm attaching a patch for meta-ti that should
>> get both core-image-x11 and core-image-weston building for Kirkstone.
> 
> I'll give this a test this week. I've included some review comments
> below so we can hopefully get something merged to fix this issue...
> 
>>  From c81fbae2cf7787ed01ee00b378e95be9d653d7df Mon Sep 17 00:00:00 2001
>> From: Andrew Davis <afd@ti.com>
>> Date: Thu, 13 Oct 2022 09:59:46 -0500
>> Subject: [PATCH] Add core-image-weston and core-image-x11 support
>>
>> This is more changes than I would normally like in a single commit
>> but these all do seem so logically connected. The goal being to
>> enable the two oe-core graphical images.
>>
>> These changes are needed due to our MACHINES all only having GLES2
>> and not the desktop OpenGL versions. That would mean these belong
>> in the layer that adds the machines and not in a distro layer.
>>
>> At some point we should add a new MACHINE_FEATURE that lets a BSP
>> layer specify the API supported by the hardware. Until then
>> we append these key recipes to switch them over to GLES2.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
> 
> I expect the long-term solution will be to add a "gles2" entry to
> MACHINE_FEATURES on the Yocto master branch, but I doubt that will be
> accepted onto the existing kirkstone branch. In the meantime we do need
> a solution which can be applied for kirkstone.
> 

Right, far too late to refactor that in kirkstone. For that we will
just have to live with the fixups in meta-ti.

> Are the changes here expected to work for all TI targets or just the
> AM335x SoC? i.e. can this be applied to the kirkstone branch in meta-ti
> once refactored into a couple of different commits (e.g. one per
> package)?

Should work on all TI targets.

> 
>> ---
>>   .../recipes-graphics/cairo/cairo_%.bbappend   |  3 ++
>>   ...abling-patch-to-not-exclude-libepoxy.patch | 46 +++++++++++++++++++
>>   .../recipes-graphics/gtk+/gtk+3_%.bbappend    |  9 ++++
>>   .../libepoxy/libepoxy_%.bbappend              |  3 ++
>>   .../xorg-xserver/xserver-xorg_%.bbappend      |  2 +
>>   .../xwayland/xwayland_%.bbappend              |  3 ++
>>   6 files changed, 66 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>   create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
>>   create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>>   create mode 100644 meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
>>   create mode 100644 meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
>>   create mode 100644 meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>> new file mode 100644
>> index 00000000..726f3911
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>> @@ -0,0 +1,3 @@
>> +PR:append:ti-soc = ".ti1"
>> +PACKAGECONFIG:append:ti-soc = " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl glesv2', '', d)}"
>> +PACKAGECONFIG:remove:ti-soc = "opengl"
>> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
>> new file mode 100644
>> index 00000000..c873fb8d
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
>> @@ -0,0 +1,46 @@
>> +From eb16e80bf1f7c51024f3ed950ae85541e5ba2233 Mon Sep 17 00:00:00 2001
>> +From: Andrew Davis <afd@ti.com>
>> +Date: Wed, 12 Oct 2022 13:05:45 -0500
>> +Subject: [PATCH] Fix OpenGL disabling patch to not exclude libepoxy
>> +
>> +Upstream-Status: Inappropriate
>> +Signed-off-by: Andrew Davis <afd@ti.com>
> 
> I think this is appropriate to fix upstream.
> 

This patch fixes another patch in oe-core. Upstream gtk+3 doesn't have this issue.

Andrew

>> +---
>> + configure.ac | 9 ++++-----
>> + 1 file changed, 4 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 3cb24e9..aa365be 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -348,10 +348,9 @@ AC_ARG_ENABLE(cloudproviders,
>> +                               [cloudproviders_set=yes])
>> + AC_ARG_ENABLE(opengl,
>> +               [AS_HELP_STRING([--enable-opengl],
>> +-                              [When enabled, Gtk+ will use libepoxy and exposes GtkGLArea widget ])])
>> ++                              [When enabled, Gtk+ exposes GtkGLArea widget ])])
>> + AS_IF([test "x$enable_opengl" != "xno"], [
>> +-  AC_DEFINE([HAVE_OPENGL], [1], [libepoxy and opengl APIs are available at buildtime])
>> +-  EPOXY_PACKAGES="epoxy >= epoxy_required_version"
>> ++  AC_DEFINE([HAVE_OPENGL], [1], [OpenGL APIs are available at buildtime])
> 
> This section can be changed to always define EPOXY_PACKAGES, or to
> define it when `--enable-epoxy` is passed on the command line if we need
> a way to enable/disable this dependency to be able to submit the patch
> upstream.
> 
>> + ])
>> + AM_CONDITIONAL([HAVE_OPENGL],[test "x$enable_opengl" != "xno"])
>> +
>> +@@ -1365,7 +1364,7 @@ CFLAGS="$saved_cflags"
>> + LDFLAGS="$saved_ldflags"
>> +
>> + GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
>> +-GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fribidi >= fribidi_required_version"
>> ++GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fribidi >= fribidi_required_version"
> 
> This line can remain unchanged if EPOXY_PACKAGES is unconditionally
> defined above.
> 
>> +
>> + PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
>> + GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
>> +@@ -1399,7 +1398,7 @@ fi
>> + PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
>> +
>> + GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
>> +-GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $EPOXY_PACKAGES fribidi >= fribidi_required_version"
>> ++GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES epoxy >= epoxy_required_version fribidi >= fribidi_required_version"
> 
> As above.
> 
>> + if test "x$enable_x11_backend" = xyes -o "x$enable_wayland_backend" = xyes; then
>> +   GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
>> + fi
>> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>> new file mode 100644
>> index 00000000..b6e82d14
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>> @@ -0,0 +1,9 @@
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>> +
>> +SRC_URI:append:ti-soc = " \
>> +	file://0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch \
>> +"
>> +
>> +PR:append:ti-soc = ".ti1"
>> +PACKAGECONFIG:remove:ti-soc = "opengl"
>> +DEPENDS:append:ti-soc = " libepoxy"
>> diff --git a/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
>> new file mode 100644
>> index 00000000..aadf5bab
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
>> @@ -0,0 +1,3 @@
>> +PR:append:ti-soc = ".ti1"
>> +PACKAGECONFIG:append:ti-soc = " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl', '', d)}"
>> +PACKAGECONFIG:remove:ti-soc = "x11"
>> diff --git a/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
>> new file mode 100644
>> index 00000000..86c1e714
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
>> @@ -0,0 +1,2 @@
>> +PR:append:ti-soc = ".ti1"
>> +OPENGL_PKGCONFIGS:ti-soc = ""
>> diff --git a/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
>> new file mode 100644
>> index 00000000..e7163207
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
>> @@ -0,0 +1,3 @@
>> +PR:append:ti-soc = ".ti1"
>> +PACKAGECONFIG:remove:ti-soc = "glx"
>> +DEPENDS:append:ti-soc = " libxshmfence"
> 
> Thanks,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15197): https://lists.yoctoproject.org/g/meta-ti/message/15197
> Mute This Topic: https://lists.yoctoproject.org/mt/93954566/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


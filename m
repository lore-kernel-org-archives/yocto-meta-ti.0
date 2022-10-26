Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773FAC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 15:47:44 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.9063.1666799262751070573
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 08:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Vd+N6vep;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29QFle6w065610;
	Wed, 26 Oct 2022 10:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666799260;
	bh=7l1KHCZe+2HENt0qQkKdOI3klycpjdWn96NcraQWLEA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Vd+N6vepCOMcanRXJBnY8273Wo83zx/knchyW1qBEAIJ+v3p3tld/du6wvMGEWzRm
	 kc/kMv1fxCZPboUa28nGDyaWeW75dZaH0N4XE1k766nXPB07fUYUoVBrvwjQEhmyQq
	 PEdbXTgAh0ItSPj6oixynMQL9x7sakQiXXjW1XbQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29QFleoS096037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Oct 2022 10:47:40 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 26
 Oct 2022 10:47:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 26 Oct 2022 10:47:40 -0500
Received: from [10.250.34.50] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29QFldde121045;
	Wed, 26 Oct 2022 10:47:39 -0500
Content-Type: multipart/mixed;
	boundary="------------cmf4xJ9Z7Cakx3tMwxSDtsw0"
Message-ID: <24278716-2707-7dfa-7538-556b68623561@ti.com>
Date: Wed, 26 Oct 2022 10:47:39 -0500
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
 <1721551A6FBDDE25.26638@lists.yoctoproject.org>
 <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 15:47:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15206

--------------cmf4xJ9Z7Cakx3tMwxSDtsw0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/22 9:06 AM, Paul Barker wrote:
> On 25/10/2022 15:08, Paul Barker wrote:
>> Hi Andrew,
>>
>> On 17/10/2022 15:30, Andrew Davis wrote:
>>> I'm attaching a patch for meta-ti that should
>>> get both core-image-x11 and core-image-weston building for Kirkstone.
>>
>> I'll give this a test this week. I've included some review comments
>> below so we can hopefully get something merged to fix this issue...
> 
> Here's my build results with this patch applied:
> 
>    * DISTRO=poky:
>        * core-image-minimal: Success
>        * core-image-base: Success
>        * core-image-x11: Success
>        * core-image-weston: Failed
> 
>    * DISTRO=arago:
>        * tisdk-base-image: Success
>        * tisdk-default-image: Failed
> 
> For both of the failed builds, the failure looks the same:
> 
> | Dependency gbm found: NO found 19.1.6 but need: '>= 21.1.1' (cached)
> | Message: dmabuf-feedback requires gbm which was not found. If you rather not build this, drop "dmabuf-feedback" from simple-clients option.
> |
> | ../weston-10.0.1/clients/meson.build:42:0: ERROR: Dependency 'gbm' is required but not found.
> |
> | A full log can be found at /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/build/meson-logs/meson-log.txt
> | ERROR: meson failed
> | WARNING: /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121:184 exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> |       #1: bbfatal_log, /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121, line 184
> |       #2: meson_do_configure, /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121, line 173
> |       #3: do_configure, /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121, line 149
> |       #4: main, /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121, line 197
> ERROR: Task (/workdir/layers/poky/meta/recipes-graphics/wayland/weston_10.0.1.bb:do_configure) failed with exit code '1'
> 
> It looks like some further work is needed on this.
> 

Ah, looks like you will need:

PACKAGECONFIG:remove:pn-weston = "clients"

Since the client demo app "dmabuf-feedback" needs Mesa >= 21.1.1, and
SGX is at 19.1.6 (will update that when the other Kirkstone forward-ports
are done).

Weston 10 also needs GL_EXT_unpack_subimage, so you'll need the attached
patch on weston for now.

Andrew

>>
>>>  From c81fbae2cf7787ed01ee00b378e95be9d653d7df Mon Sep 17 00:00:00 2001
>>> From: Andrew Davis <afd@ti.com>
>>> Date: Thu, 13 Oct 2022 09:59:46 -0500
>>> Subject: [PATCH] Add core-image-weston and core-image-x11 support
>>>
>>> This is more changes than I would normally like in a single commit
>>> but these all do seem so logically connected. The goal being to
>>> enable the two oe-core graphical images.
>>>
>>> These changes are needed due to our MACHINES all only having GLES2
>>> and not the desktop OpenGL versions. That would mean these belong
>>> in the layer that adds the machines and not in a distro layer.
>>>
>>> At some point we should add a new MACHINE_FEATURE that lets a BSP
>>> layer specify the API supported by the hardware. Until then
>>> we append these key recipes to switch them over to GLES2.
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>
>> I expect the long-term solution will be to add a "gles2" entry to
>> MACHINE_FEATURES on the Yocto master branch, but I doubt that will be
>> accepted onto the existing kirkstone branch. In the meantime we do need
>> a solution which can be applied for kirkstone.
>>
>> Are the changes here expected to work for all TI targets or just the
>> AM335x SoC? i.e. can this be applied to the kirkstone branch in meta-ti
>> once refactored into a couple of different commits (e.g. one per
>> package)?
>>
>>> ---
>>>   .../recipes-graphics/cairo/cairo_%.bbappend   |  3 ++
>>>   ...abling-patch-to-not-exclude-libepoxy.patch | 46 +++++++++++++++++++
>>>   .../recipes-graphics/gtk+/gtk+3_%.bbappend    |  9 ++++
>>>   .../libepoxy/libepoxy_%.bbappend              |  3 ++
>>>   .../xorg-xserver/xserver-xorg_%.bbappend      |  2 +
>>>   .../xwayland/xwayland_%.bbappend              |  3 ++
>>>   6 files changed, 66 insertions(+)
>>>   create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>>   create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
>>>   create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>>>   create mode 100644 meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
>>>   create mode 100644 meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
>>>   create mode 100644 meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
>>>
>>> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>> new file mode 100644
>>> index 00000000..726f3911
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>> @@ -0,0 +1,3 @@
>>> +PR:append:ti-soc = ".ti1"
>>> +PACKAGECONFIG:append:ti-soc = " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl glesv2', '', d)}"
>>> +PACKAGECONFIG:remove:ti-soc = "opengl"
>>> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
>>> new file mode 100644
>>> index 00000000..c873fb8d
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
>>> @@ -0,0 +1,46 @@
>>> +From eb16e80bf1f7c51024f3ed950ae85541e5ba2233 Mon Sep 17 00:00:00 2001
>>> +From: Andrew Davis <afd@ti.com>
>>> +Date: Wed, 12 Oct 2022 13:05:45 -0500
>>> +Subject: [PATCH] Fix OpenGL disabling patch to not exclude libepoxy
>>> +
>>> +Upstream-Status: Inappropriate
>>> +Signed-off-by: Andrew Davis <afd@ti.com>
>>
>> I think this is appropriate to fix upstream.
>>
>>> +---
>>> + configure.ac | 9 ++++-----
>>> + 1 file changed, 4 insertions(+), 5 deletions(-)
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index 3cb24e9..aa365be 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -348,10 +348,9 @@ AC_ARG_ENABLE(cloudproviders,
>>> +                               [cloudproviders_set=yes])
>>> + AC_ARG_ENABLE(opengl,
>>> +               [AS_HELP_STRING([--enable-opengl],
>>> +-                              [When enabled, Gtk+ will use libepoxy and exposes GtkGLArea widget ])])
>>> ++                              [When enabled, Gtk+ exposes GtkGLArea widget ])])
>>> + AS_IF([test "x$enable_opengl" != "xno"], [
>>> +-  AC_DEFINE([HAVE_OPENGL], [1], [libepoxy and opengl APIs are available at buildtime])
>>> +-  EPOXY_PACKAGES="epoxy >= epoxy_required_version"
>>> ++  AC_DEFINE([HAVE_OPENGL], [1], [OpenGL APIs are available at buildtime])
>>
>> This section can be changed to always define EPOXY_PACKAGES, or to
>> define it when `--enable-epoxy` is passed on the command line if we need
>> a way to enable/disable this dependency to be able to submit the patch
>> upstream.
>>
>>> + ])
>>> + AM_CONDITIONAL([HAVE_OPENGL],[test "x$enable_opengl" != "xno"])
>>> +
>>> +@@ -1365,7 +1364,7 @@ CFLAGS="$saved_cflags"
>>> + LDFLAGS="$saved_ldflags"
>>> +
>>> + GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
>>> +-GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fribidi >= fribidi_required_version"
>>> ++GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fribidi >= fribidi_required_version"
>>
>> This line can remain unchanged if EPOXY_PACKAGES is unconditionally
>> defined above.
>>
>>> +
>>> + PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
>>> + GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
>>> +@@ -1399,7 +1398,7 @@ fi
>>> + PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
>>> +
>>> + GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
>>> +-GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $EPOXY_PACKAGES fribidi >= fribidi_required_version"
>>> ++GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES epoxy >= epoxy_required_version fribidi >= fribidi_required_version"
>>
>> As above.
>>
>>> + if test "x$enable_x11_backend" = xyes -o "x$enable_wayland_backend" = xyes; then
>>> +   GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
>>> + fi
>>> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>>> new file mode 100644
>>> index 00000000..b6e82d14
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>>> @@ -0,0 +1,9 @@
>>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>>> +
>>> +SRC_URI:append:ti-soc = " \
>>> +	file://0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch \
>>> +"
>>> +
>>> +PR:append:ti-soc = ".ti1"
>>> +PACKAGECONFIG:remove:ti-soc = "opengl"
>>> +DEPENDS:append:ti-soc = " libepoxy"
>>> diff --git a/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
>>> new file mode 100644
>>> index 00000000..aadf5bab
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
>>> @@ -0,0 +1,3 @@
>>> +PR:append:ti-soc = ".ti1"
>>> +PACKAGECONFIG:append:ti-soc = " ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl', '', d)}"
>>> +PACKAGECONFIG:remove:ti-soc = "x11"
>>> diff --git a/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
>>> new file mode 100644
>>> index 00000000..86c1e714
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
>>> @@ -0,0 +1,2 @@
>>> +PR:append:ti-soc = ".ti1"
>>> +OPENGL_PKGCONFIGS:ti-soc = ""
>>> diff --git a/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
>>> new file mode 100644
>>> index 00000000..e7163207
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
>>> @@ -0,0 +1,3 @@
>>> +PR:append:ti-soc = ".ti1"
>>> +PACKAGECONFIG:remove:ti-soc = "glx"
>>> +DEPENDS:append:ti-soc = " libxshmfence"
>>
>> Thanks,
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15197): https://lists.yoctoproject.org/g/meta-ti/message/15197
>> Mute This Topic: https://lists.yoctoproject.org/mt/93954566/6609808
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [paul.barker@sancloud.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
--------------cmf4xJ9Z7Cakx3tMwxSDtsw0
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-Revert-gl-renderer-require-GL_EXT_unpack_subimage.patch"
Content-Disposition: attachment;
	filename="0001-Revert-gl-renderer-require-GL_EXT_unpack_subimage.patch"
Content-Transfer-Encoding: base64

RnJvbSA1ZmMyODJiYjljMGJlY2NkODcxNjBhZjYzZTQ1YWJiYWIwMGYyYjI0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+CkRhdGU6
IFRodSwgNiBPY3QgMjAyMiAxNTo0OTozMSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIFJldmVy
dCAiZ2wtcmVuZGVyZXI6IHJlcXVpcmUgR0xfRVhUX3VucGFja19zdWJpbWFnZSIKClRoaXMg
cmV2ZXJ0cyBjb21taXQgNTkzZDVhZjQzYThlMmMyYTMzNzEwODhmYTdhZTQzMGQwNTE3Yzgy
ZC4KLS0tCiBsaWJ3ZXN0b24vcmVuZGVyZXItZ2wvZ2wtcmVuZGVyZXItaW50ZXJuYWwuaCB8
ICAyICsrCiBsaWJ3ZXN0b24vcmVuZGVyZXItZ2wvZ2wtcmVuZGVyZXIuYyAgICAgICAgICB8
IDI5ICsrKysrKysrKysrKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGlid2VzdG9uL3JlbmRlcmVy
LWdsL2dsLXJlbmRlcmVyLWludGVybmFsLmggYi9saWJ3ZXN0b24vcmVuZGVyZXItZ2wvZ2wt
cmVuZGVyZXItaW50ZXJuYWwuaAppbmRleCA3MjEwMWI0Ny4uN2E2ZTJmNDggMTAwNjQ0Ci0t
LSBhL2xpYndlc3Rvbi9yZW5kZXJlci1nbC9nbC1yZW5kZXJlci1pbnRlcm5hbC5oCisrKyBi
L2xpYndlc3Rvbi9yZW5kZXJlci1nbC9nbC1yZW5kZXJlci1pbnRlcm5hbC5oCkBAIC0xMzMs
NiArMTMzLDggQEAgc3RydWN0IGdsX3JlbmRlcmVyIHsKIAlQRk5FR0xDUkVBVEVQTEFURk9S
TVdJTkRPV1NVUkZBQ0VFWFRQUk9DIGNyZWF0ZV9wbGF0Zm9ybV93aW5kb3c7CiAJYm9vbCBo
YXNfcGxhdGZvcm1fYmFzZTsKIAorCWJvb2wgaGFzX3VucGFja19zdWJpbWFnZTsKKwogCVBG
TkVHTEJJTkRXQVlMQU5ERElTUExBWVdMIGJpbmRfZGlzcGxheTsKIAlQRk5FR0xVTkJJTkRX
QVlMQU5ERElTUExBWVdMIHVuYmluZF9kaXNwbGF5OwogCVBGTkVHTFFVRVJZV0FZTEFOREJV
RkZFUldMIHF1ZXJ5X2J1ZmZlcjsKZGlmZiAtLWdpdCBhL2xpYndlc3Rvbi9yZW5kZXJlci1n
bC9nbC1yZW5kZXJlci5jIGIvbGlid2VzdG9uL3JlbmRlcmVyLWdsL2dsLXJlbmRlcmVyLmMK
aW5kZXggYTVmNWVhZTQuLjQxMGJhODVjIDEwMDY0NAotLS0gYS9saWJ3ZXN0b24vcmVuZGVy
ZXItZ2wvZ2wtcmVuZGVyZXIuYworKysgYi9saWJ3ZXN0b24vcmVuZGVyZXItZ2wvZ2wtcmVu
ZGVyZXIuYwpAQCAtMTgzNSw2ICsxODM1LDcgQEAgZ2xfcmVuZGVyZXJfZmx1c2hfZGFtYWdl
KHN0cnVjdCB3ZXN0b25fc3VyZmFjZSAqc3VyZmFjZSkKIHsKIAljb25zdCBzdHJ1Y3Qgd2Vz
dG9uX3Rlc3RzdWl0ZV9xdWlya3MgKnF1aXJrcyA9CiAJCSZzdXJmYWNlLT5jb21wb3NpdG9y
LT50ZXN0X2RhdGEudGVzdF9xdWlya3M7CisJc3RydWN0IGdsX3JlbmRlcmVyICpnciA9IGdl
dF9yZW5kZXJlcihzdXJmYWNlLT5jb21wb3NpdG9yKTsKIAlzdHJ1Y3QgZ2xfc3VyZmFjZV9z
dGF0ZSAqZ3MgPSBnZXRfc3VyZmFjZV9zdGF0ZShzdXJmYWNlKTsKIAlzdHJ1Y3Qgd2VzdG9u
X2J1ZmZlciAqYnVmZmVyID0gZ3MtPmJ1ZmZlcl9yZWYuYnVmZmVyOwogCXN0cnVjdCB3ZXN0
b25fdmlldyAqdmlldzsKQEAgLTE4NzIsNiArMTg3MywyNCBAQCBnbF9yZW5kZXJlcl9mbHVz
aF9kYW1hZ2Uoc3RydWN0IHdlc3Rvbl9zdXJmYWNlICpzdXJmYWNlKQogCiAJZ2xBY3RpdmVU
ZXh0dXJlKEdMX1RFWFRVUkUwKTsKIAorCWlmICghZ3ItPmhhc191bnBhY2tfc3ViaW1hZ2Up
IHsKKwkJd2xfc2htX2J1ZmZlcl9iZWdpbl9hY2Nlc3MoYnVmZmVyLT5zaG1fYnVmZmVyKTsK
KwkJZm9yIChqID0gMDsgaiA8IGdzLT5udW1fdGV4dHVyZXM7IGorKykgeworCQkJZ2xCaW5k
VGV4dHVyZShHTF9URVhUVVJFXzJELCBncy0+dGV4dHVyZXNbal0pOworCQkJZ2xUZXhJbWFn
ZTJEKEdMX1RFWFRVUkVfMkQsIDAsCisJCQkJICAgICBncy0+Z2xfZm9ybWF0W2pdLAorCQkJ
CSAgICAgZ3MtPnBpdGNoIC8gZ3MtPmhzdWJbal0sCisJCQkJICAgICBidWZmZXItPmhlaWdo
dCAvIGdzLT52c3ViW2pdLAorCQkJCSAgICAgMCwKKwkJCQkgICAgIGdsX2Zvcm1hdF9mcm9t
X2ludGVybmFsKGdzLT5nbF9mb3JtYXRbal0pLAorCQkJCSAgICAgZ3MtPmdsX3BpeGVsX3R5
cGUsCisJCQkJICAgICBkYXRhICsgZ3MtPm9mZnNldFtqXSk7CisJCX0KKwkJd2xfc2htX2J1
ZmZlcl9lbmRfYWNjZXNzKGJ1ZmZlci0+c2htX2J1ZmZlcik7CisKKwkJZ290byBkb25lOwor
CX0KKwogCWlmIChncy0+bmVlZHNfZnVsbF91cGxvYWQgfHwgcXVpcmtzLT5nbF9mb3JjZV9m
dWxsX3VwbG9hZCkgewogCQlnbFBpeGVsU3RvcmVpKEdMX1VOUEFDS19TS0lQX1BJWEVMU19F
WFQsIDApOwogCQlnbFBpeGVsU3RvcmVpKEdMX1VOUEFDS19TS0lQX1JPV1NfRVhULCAwKTsK
QEAgLTM5MzIsMTEgKzM5NTEsOSBAQCBnbF9yZW5kZXJlcl9zZXR1cChzdHJ1Y3Qgd2VzdG9u
X2NvbXBvc2l0b3IgKmVjLCBFR0xTdXJmYWNlIGVnbF9zdXJmYWNlKQogCWVsc2UKIAkJZWMt
PnJlYWRfZm9ybWF0ID0gUElYTUFOX2E4YjhnOHI4OwogCi0JaWYgKGdyLT5nbF92ZXJzaW9u
IDwgZ3JfZ2xfdmVyc2lvbigzLCAwKSAmJgotCSAgICAhd2VzdG9uX2NoZWNrX2VnbF9leHRl
bnNpb24oZXh0ZW5zaW9ucywgIkdMX0VYVF91bnBhY2tfc3ViaW1hZ2UiKSkgewotCQl3ZXN0
b25fbG9nKCJHTF9FWFRfdW5wYWNrX3N1YmltYWdlIG5vdCBhdmFpbGFibGUuXG4iKTsKLQkJ
cmV0dXJuIC0xOwotCX0KKwlpZiAoZ3ItPmdsX3ZlcnNpb24gPj0gZ3JfZ2xfdmVyc2lvbigz
LCAwKSB8fAorCSAgICB3ZXN0b25fY2hlY2tfZWdsX2V4dGVuc2lvbihleHRlbnNpb25zLCAi
R0xfRVhUX3VucGFja19zdWJpbWFnZSIpKQorCQlnci0+aGFzX3VucGFja19zdWJpbWFnZSA9
IHRydWU7CiAKIAlpZiAoZ3ItPmdsX3ZlcnNpb24gPj0gZ3JfZ2xfdmVyc2lvbigzLCAwKSB8
fAogCSAgICB3ZXN0b25fY2hlY2tfZWdsX2V4dGVuc2lvbihleHRlbnNpb25zLCAiR0xfRVhU
X3RleHR1cmVfdHlwZV8yXzEwXzEwXzEwX1JFViIpKQpAQCAtMzk3Nyw2ICszOTk0LDggQEAg
Z2xfcmVuZGVyZXJfc2V0dXAoc3RydWN0IHdlc3Rvbl9jb21wb3NpdG9yICplYywgRUdMU3Vy
ZmFjZSBlZ2xfc3VyZmFjZSkKIAkJICAgZ3JfZ2xfdmVyc2lvbl9taW5vcihnci0+Z2xfdmVy
c2lvbikpOwogCXdlc3Rvbl9sb2dfY29udGludWUoU1RBTVBfU1BBQ0UgInJlYWQtYmFjayBm
b3JtYXQ6ICVzXG4iLAogCQllYy0+cmVhZF9mb3JtYXQgPT0gUElYTUFOX2E4cjhnOGI4ID8g
IkJHUkEiIDogIlJHQkEiKTsKKwl3ZXN0b25fbG9nX2NvbnRpbnVlKFNUQU1QX1NQQUNFICJ3
bF9zaG0gc3ViLWltYWdlIHRvIHRleHR1cmU6ICVzXG4iLAorCQkJICAgIGdyLT5oYXNfdW5w
YWNrX3N1YmltYWdlID8gInllcyIgOiAibm8iKTsKIAl3ZXN0b25fbG9nX2NvbnRpbnVlKFNU
QU1QX1NQQUNFICJFR0wgV2F5bGFuZCBleHRlbnNpb246ICVzXG4iLAogCQkJICAgIGdyLT5o
YXNfYmluZF9kaXNwbGF5ID8gInllcyIgOiAibm8iKTsKIAotLSAKMi4zNy4zCgo=

--------------cmf4xJ9Z7Cakx3tMwxSDtsw0--


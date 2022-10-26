Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DA9C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 15:12:54 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web09.8864.1666797170276707010
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 08:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gmSrd3LZ;
 spf=pass (domain: konsulko.com, ip: 209.85.219.176, mailfrom: denys.dmytriyenko@konsulko.com)
Received: by mail-yb1-f176.google.com with SMTP id j7so19255545ybb.8
        for <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t5bh11rs90e47C61fZcX514SgDHY6LZ3wPixldufGw4=;
        b=gmSrd3LZfMdI6kayLO6Y0Y2aXBe9ckpn6uuxZfQcKPX+I5W65JoVebivtyVGxYY1vf
         Ns1pQBz+fgls222oZnkJdpXpF9kZXMz/tDbg+zryG71zqELierEnp8yT8CAVBwjShvMD
         0sEibIS5FGYGX2UhbAws0v0reoRm6sCiPkcJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5bh11rs90e47C61fZcX514SgDHY6LZ3wPixldufGw4=;
        b=f2PVIQLjJB7X2l7/ccdj5c+SV8wWI1rSbSZHv7XtGzrqzKxZzYilJ1Fh8ZeFgnZg20
         1UF94glR7Hxt+h7XNcDv/N2yr8i0t8lgvW5eXGJfnYlBQeSjlICRKtF03ckitVnUk6oT
         +alOWkRV7BFW/XVRrKB2JmP9m7Oexvh3cd7nKaL502pdbyEeUXBCr528kKusdIt/+gmE
         Dp+xJCLinIh91qHBwxf7dV57k6sf9rynbi2msdapU8LJUPxxy3fTpZ6fP0rjCfgUUMZ5
         Dn5KgKEXenDPfLNVJ4b0gSjU8mpyVUdHz0QFMjKX1ak6mQNLHanDUfjpcgPf5j35dhnZ
         JrsQ==
X-Gm-Message-State: ACrzQf3wND1q+ksSwwyL5vX/Eej3nMMzKixDlM7zKPh88GtVUQdbqDJo
	se0wjVinVs/1xY2rDwBm1Y/2BKN1qPNvWwJ81kpfpw==
X-Google-Smtp-Source: AMsMyM7rpEzRRnFcGkltKNEDFsg/aSEULeopWN9z0AoOkSTeJhM424ynvMQvkxGGVlFC2Tm78NxHZyUuboyw/eYSbmw=
X-Received: by 2002:a25:9a84:0:b0:6ca:36b2:f005 with SMTP id
 s4-20020a259a84000000b006ca36b2f005mr29167846ybo.60.1666797169316; Wed, 26
 Oct 2022 08:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com> <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com> <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com> <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
 <1721551A6FBDDE25.26638@lists.yoctoproject.org> <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
In-Reply-To: <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
From: Denys Dmytriyenko <denys@konsulko.com>
Date: Wed, 26 Oct 2022 11:12:37 -0400
Message-ID: <CAB2aN6P44KSxngO4JNaCe9df5Bqjh1v0eDFCHZ5FAOn+JK9LnA@mail.gmail.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
To: Paul Barker <paul.barker@sancloud.com>
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org, 
	Ryan Eatmon <reatmon@ti.com>
Content-Type: multipart/alternative; boundary="00000000000030ad8405ebf17548"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 15:12:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15205

--00000000000030ad8405ebf17548
Content-Type: text/plain; charset="UTF-8"

Weston 10 build failure is known and is being worked on.

For details and a temporary workaround see this:

https://patchwork.yoctoproject.org/project/arago/patch/20220329053703.2367559-1-denis@denix.org/

-- 
Denys

PS. Replying from the phone, sorry for the format.


On Wed, Oct 26, 2022, 10:06 AM Paul Barker <paul.barker@sancloud.com> wrote:

> On 25/10/2022 15:08, Paul Barker wrote:
> > Hi Andrew,
> >
> > On 17/10/2022 15:30, Andrew Davis wrote:
> >> I'm attaching a patch for meta-ti that should
> >> get both core-image-x11 and core-image-weston building for Kirkstone.
> >
> > I'll give this a test this week. I've included some review comments
> > below so we can hopefully get something merged to fix this issue...
>
> Here's my build results with this patch applied:
>
>   * DISTRO=poky:
>       * core-image-minimal: Success
>       * core-image-base: Success
>       * core-image-x11: Success
>       * core-image-weston: Failed
>
>   * DISTRO=arago:
>       * tisdk-base-image: Success
>       * tisdk-default-image: Failed
>
> For both of the failed builds, the failure looks the same:
>
> | Dependency gbm found: NO found 19.1.6 but need: '>= 21.1.1' (cached)
> | Message: dmabuf-feedback requires gbm which was not found. If you rather
> not build this, drop "dmabuf-feedback" from simple-clients option.
> |
> | ../weston-10.0.1/clients/meson.build:42:0: ERROR: Dependency 'gbm' is
> required but not found.
> |
> | A full log can be found at
> /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/build/meson-logs/meson-log.txt
> | ERROR: meson failed
> | WARNING:
> /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121:184
> exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> |       #1: bbfatal_log,
> /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121,
> line 184
> |       #2: meson_do_configure,
> /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121,
> line 173
> |       #3: do_configure,
> /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121,
> line 149
> |       #4: main,
> /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121,
> line 197
> ERROR: Task
> (/workdir/layers/poky/meta/recipes-graphics/wayland/weston_10.0.1.bb:do_configure)
> failed with exit code '1'
>
> It looks like some further work is needed on this.
>
> >
> >> From c81fbae2cf7787ed01ee00b378e95be9d653d7df Mon Sep 17 00:00:00 2001
> >> From: Andrew Davis <afd@ti.com>
> >> Date: Thu, 13 Oct 2022 09:59:46 -0500
> >> Subject: [PATCH] Add core-image-weston and core-image-x11 support
> >>
> >> This is more changes than I would normally like in a single commit
> >> but these all do seem so logically connected. The goal being to
> >> enable the two oe-core graphical images.
> >>
> >> These changes are needed due to our MACHINES all only having GLES2
> >> and not the desktop OpenGL versions. That would mean these belong
> >> in the layer that adds the machines and not in a distro layer.
> >>
> >> At some point we should add a new MACHINE_FEATURE that lets a BSP
> >> layer specify the API supported by the hardware. Until then
> >> we append these key recipes to switch them over to GLES2.
> >>
> >> Signed-off-by: Andrew Davis <afd@ti.com>
> >
> > I expect the long-term solution will be to add a "gles2" entry to
> > MACHINE_FEATURES on the Yocto master branch, but I doubt that will be
> > accepted onto the existing kirkstone branch. In the meantime we do need
> > a solution which can be applied for kirkstone.
> >
> > Are the changes here expected to work for all TI targets or just the
> > AM335x SoC? i.e. can this be applied to the kirkstone branch in meta-ti
> > once refactored into a couple of different commits (e.g. one per
> > package)?
> >
> >> ---
> >>  .../recipes-graphics/cairo/cairo_%.bbappend   |  3 ++
> >>  ...abling-patch-to-not-exclude-libepoxy.patch | 46 +++++++++++++++++++
> >>  .../recipes-graphics/gtk+/gtk+3_%.bbappend    |  9 ++++
> >>  .../libepoxy/libepoxy_%.bbappend              |  3 ++
> >>  .../xorg-xserver/xserver-xorg_%.bbappend      |  2 +
> >>  .../xwayland/xwayland_%.bbappend              |  3 ++
> >>  6 files changed, 66 insertions(+)
> >>  create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> >>  create mode 100644
> meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
> >>  create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
> >>  create mode 100644
> meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
> >>  create mode 100644
> meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> >>  create mode 100644
> meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
> >>
> >> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> >> new file mode 100644
> >> index 00000000..726f3911
> >> --- /dev/null
> >> +++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> >> @@ -0,0 +1,3 @@
> >> +PR:append:ti-soc = ".ti1"
> >> +PACKAGECONFIG:append:ti-soc = "
> ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl glesv2', '', d)}"
> >> +PACKAGECONFIG:remove:ti-soc = "opengl"
> >> diff --git
> a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
> b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
> >> new file mode 100644
> >> index 00000000..c873fb8d
> >> --- /dev/null
> >> +++
> b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch
> >> @@ -0,0 +1,46 @@
> >> +From eb16e80bf1f7c51024f3ed950ae85541e5ba2233 Mon Sep 17 00:00:00 2001
> >> +From: Andrew Davis <afd@ti.com>
> >> +Date: Wed, 12 Oct 2022 13:05:45 -0500
> >> +Subject: [PATCH] Fix OpenGL disabling patch to not exclude libepoxy
> >> +
> >> +Upstream-Status: Inappropriate
> >> +Signed-off-by: Andrew Davis <afd@ti.com>
> >
> > I think this is appropriate to fix upstream.
> >
> >> +---
> >> + configure.ac | 9 ++++-----
> >> + 1 file changed, 4 insertions(+), 5 deletions(-)
> >> +
> >> +diff --git a/configure.ac b/configure.ac
> >> +index 3cb24e9..aa365be 100644
> >> +--- a/configure.ac
> >> ++++ b/configure.ac
> >> +@@ -348,10 +348,9 @@ AC_ARG_ENABLE(cloudproviders,
> >> +                               [cloudproviders_set=yes])
> >> + AC_ARG_ENABLE(opengl,
> >> +               [AS_HELP_STRING([--enable-opengl],
> >> +-                              [When enabled, Gtk+ will use libepoxy
> and exposes GtkGLArea widget ])])
> >> ++                              [When enabled, Gtk+ exposes GtkGLArea
> widget ])])
> >> + AS_IF([test "x$enable_opengl" != "xno"], [
> >> +-  AC_DEFINE([HAVE_OPENGL], [1], [libepoxy and opengl APIs are
> available at buildtime])
> >> +-  EPOXY_PACKAGES="epoxy >= epoxy_required_version"
> >> ++  AC_DEFINE([HAVE_OPENGL], [1], [OpenGL APIs are available at
> buildtime])
> >
> > This section can be changed to always define EPOXY_PACKAGES, or to
> > define it when `--enable-epoxy` is passed on the command line if we need
> > a way to enable/disable this dependency to be able to submit the patch
> > upstream.
> >
> >> + ])
> >> + AM_CONDITIONAL([HAVE_OPENGL],[test "x$enable_opengl" != "xno"])
> >> +
> >> +@@ -1365,7 +1364,7 @@ CFLAGS="$saved_cflags"
> >> + LDFLAGS="$saved_ldflags"
> >> +
> >> + GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >=
> gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject
> >= cairo_required_version"
> >> +-GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES
> $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES
> fribidi >= fribidi_required_version"
> >> ++GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES
> $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES
> $PROFILER_PACKAGES fribidi >= fribidi_required_version"
> >
> > This line can remain unchanged if EPOXY_PACKAGES is unconditionally
> > defined above.
> >
> >> +
> >> + PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
> >> + GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
> >> +@@ -1399,7 +1398,7 @@ fi
> >> + PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
> >> +
> >> + GTK_PACKAGES="atk >= atk_required_version cairo >=
> cairo_required_version cairo-gobject >= cairo_required_version
> gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >=
> glib_required_version"
> >> +-GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $EPOXY_PACKAGES
> fribidi >= fribidi_required_version"
> >> ++GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES epoxy >=
> epoxy_required_version fribidi >= fribidi_required_version"
> >
> > As above.
> >
> >> + if test "x$enable_x11_backend" = xyes -o "x$enable_wayland_backend" =
> xyes; then
> >> +   GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
> >> + fi
> >> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
> b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
> >> new file mode 100644
> >> index 00000000..b6e82d14
> >> --- /dev/null
> >> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
> >> @@ -0,0 +1,9 @@
> >> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >> +
> >> +SRC_URI:append:ti-soc = " \
> >> +
> file://0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch \
> >> +"
> >> +
> >> +PR:append:ti-soc = ".ti1"
> >> +PACKAGECONFIG:remove:ti-soc = "opengl"
> >> +DEPENDS:append:ti-soc = " libepoxy"
> >> diff --git a/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
> b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
> >> new file mode 100644
> >> index 00000000..aadf5bab
> >> --- /dev/null
> >> +++ b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
> >> @@ -0,0 +1,3 @@
> >> +PR:append:ti-soc = ".ti1"
> >> +PACKAGECONFIG:append:ti-soc = "
> ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'egl', '', d)}"
> >> +PACKAGECONFIG:remove:ti-soc = "x11"
> >> diff --git
> a/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> >> new file mode 100644
> >> index 00000000..86c1e714
> >> --- /dev/null
> >> +++ b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> >> @@ -0,0 +1,2 @@
> >> +PR:append:ti-soc = ".ti1"
> >> +OPENGL_PKGCONFIGS:ti-soc = ""
> >> diff --git a/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
> b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
> >> new file mode 100644
> >> index 00000000..e7163207
> >> --- /dev/null
> >> +++ b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
> >> @@ -0,0 +1,3 @@
> >> +PR:append:ti-soc = ".ti1"
> >> +PACKAGECONFIG:remove:ti-soc = "glx"
> >> +DEPENDS:append:ti-soc = " libxshmfence"
> >
> > Thanks,
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#15197):
> https://lists.yoctoproject.org/g/meta-ti/message/15197
> > Mute This Topic: https://lists.yoctoproject.org/mt/93954566/6609808
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> paul.barker@sancloud.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> Paul Barker
> Principal Software Engineer
> SanCloud Ltd
>
> e: paul.barker@sancloud.com
> w: https://sancloud.com/

--00000000000030ad8405ebf17548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Weston 10 build failure is known and is being worked on.<=
div dir=3D"auto"><br></div><div dir=3D"auto">For details and a temporary wo=
rkaround see this:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a hr=
ef=3D"https://patchwork.yoctoproject.org/project/arago/patch/20220329053703=
.2367559-1-denis@denix.org/">https://patchwork.yoctoproject.org/project/ara=
go/patch/20220329053703.2367559-1-denis@denix.org/</a><br></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">--=C2=A0</div><div dir=3D"auto">Denys</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">PS. Replying from the phon=
e, sorry for the format.</div><div dir=3D"auto"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 26, 2=
022, 10:06 AM Paul Barker &lt;<a href=3D"mailto:paul.barker@sancloud.com">p=
aul.barker@sancloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On 25/10/2022 15:08, Paul Barker wrote:<br>
&gt; Hi Andrew,<br>
&gt; <br>
&gt; On 17/10/2022 15:30, Andrew Davis wrote:<br>
&gt;&gt; I&#39;m attaching a patch for meta-ti that should<br>
&gt;&gt; get both core-image-x11 and core-image-weston building for Kirksto=
ne.<br>
&gt; <br>
&gt; I&#39;ll give this a test this week. I&#39;ve included some review com=
ments<br>
&gt; below so we can hopefully get something merged to fix this issue...<br=
>
<br>
Here&#39;s my build results with this patch applied:<br>
<br>
=C2=A0 * DISTRO=3Dpoky:<br>
=C2=A0 =C2=A0 =C2=A0 * core-image-minimal: Success<br>
=C2=A0 =C2=A0 =C2=A0 * core-image-base: Success<br>
=C2=A0 =C2=A0 =C2=A0 * core-image-x11: Success<br>
=C2=A0 =C2=A0 =C2=A0 * core-image-weston: Failed<br>
<br>
=C2=A0 * DISTRO=3Darago:<br>
=C2=A0 =C2=A0 =C2=A0 * tisdk-base-image: Success<br>
=C2=A0 =C2=A0 =C2=A0 * tisdk-default-image: Failed<br>
<br>
For both of the failed builds, the failure looks the same:<br>
<br>
| Dependency gbm found: NO found 19.1.6 but need: &#39;&gt;=3D 21.1.1&#39; =
(cached)<br>
| Message: dmabuf-feedback requires gbm which was not found. If you rather =
not build this, drop &quot;dmabuf-feedback&quot; from simple-clients option=
.<br>
| <br>
| ../weston-10.0.1/clients/meson.build:42:0: ERROR: Dependency &#39;gbm&#39=
; is required but not found.<br>
| <br>
| A full log can be found at /workdir/build-kirkstone/tmp/work/armv7at2hf-n=
eon-poky-linux-gnueabi/weston/10.0.1-r0/build/meson-logs/meson-log.txt<br>
| ERROR: meson failed<br>
| WARNING: /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-gnu=
eabi/weston/10.0.1-r0/temp/run.do_configure.1057121:184 exit 1 from &#39;ex=
it 1&#39;<br>
| WARNING: Backtrace (BB generated script):<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0#1: bbfatal_log, /workdir/build-kirkstone/tmp/w=
ork/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configu=
re.1057121, line 184<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0#2: meson_do_configure, /workdir/build-kirkston=
e/tmp/work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_=
configure.1057121, line 173<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0#3: do_configure, /workdir/build-kirkstone/tmp/=
work/armv7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_config=
ure.1057121, line 149<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0#4: main, /workdir/build-kirkstone/tmp/work/arm=
v7at2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057=
121, line 197<br>
ERROR: Task (/workdir/layers/poky/meta/recipes-graphics/wayland/weston_10.0=
.1.bb:do_configure) failed with exit code &#39;1&#39;<br>
<br>
It looks like some further work is needed on this.<br>
<br>
&gt; <br>
&gt;&gt; From c81fbae2cf7787ed01ee00b378e95be9d653d7df Mon Sep 17 00:00:00 =
2001<br>
&gt;&gt; From: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" target=3D"_bl=
ank" rel=3D"noreferrer">afd@ti.com</a>&gt;<br>
&gt;&gt; Date: Thu, 13 Oct 2022 09:59:46 -0500<br>
&gt;&gt; Subject: [PATCH] Add core-image-weston and core-image-x11 support<=
br>
&gt;&gt;<br>
&gt;&gt; This is more changes than I would normally like in a single commit=
<br>
&gt;&gt; but these all do seem so logically connected. The goal being to<br=
>
&gt;&gt; enable the two oe-core graphical images.<br>
&gt;&gt;<br>
&gt;&gt; These changes are needed due to our MACHINES all only having GLES2=
<br>
&gt;&gt; and not the desktop OpenGL versions. That would mean these belong<=
br>
&gt;&gt; in the layer that adds the machines and not in a distro layer.<br>
&gt;&gt;<br>
&gt;&gt; At some point we should add a new MACHINE_FEATURE that lets a BSP<=
br>
&gt;&gt; layer specify the API supported by the hardware. Until then<br>
&gt;&gt; we append these key recipes to switch them over to GLES2.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" targ=
et=3D"_blank" rel=3D"noreferrer">afd@ti.com</a>&gt;<br>
&gt; <br>
&gt; I expect the long-term solution will be to add a &quot;gles2&quot; ent=
ry to<br>
&gt; MACHINE_FEATURES on the Yocto master branch, but I doubt that will be<=
br>
&gt; accepted onto the existing kirkstone branch. In the meantime we do nee=
d<br>
&gt; a solution which can be applied for kirkstone.<br>
&gt; <br>
&gt; Are the changes here expected to work for all TI targets or just the<b=
r>
&gt; AM335x SoC? i.e. can this be applied to the kirkstone branch in meta-t=
i<br>
&gt; once refactored into a couple of different commits (e.g. one per<br>
&gt; package)?<br>
&gt; <br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../recipes-graphics/cairo/cairo_%.bbappend=C2=A0 =C2=A0|=C2=
=A0 3 ++<br>
&gt;&gt;=C2=A0 ...abling-patch-to-not-exclude-libepoxy.patch | 46 +++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../recipes-graphics/gtk+/gtk+3_%.bbappend=C2=A0 =C2=A0 |=C2=
=A0 9 ++++<br>
&gt;&gt;=C2=A0 .../libepoxy/libepoxy_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br>
&gt;&gt;=C2=A0 .../xorg-xserver/xserver-xorg_%.bbappend=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 2 +<br>
&gt;&gt;=C2=A0 .../xwayland/xwayland_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br>
&gt;&gt;=C2=A0 6 files changed, 66 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_=
%.bbappend<br>
&gt;&gt;=C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0=
001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%=
.bbappend<br>
&gt;&gt;=C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/libepoxy/lib=
epoxy_%.bbappend<br>
&gt;&gt;=C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/xorg-xserver=
/xserver-xorg_%.bbappend<br>
&gt;&gt;=C2=A0 create mode 100644 meta-ti-bsp/recipes-graphics/xwayland/xwa=
yland_%.bbappend<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b=
/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000..726f3911<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend<br>
&gt;&gt; @@ -0,0 +1,3 @@<br>
&gt;&gt; +PR:append:ti-soc =3D &quot;.ti1&quot;<br>
&gt;&gt; +PACKAGECONFIG:append:ti-soc =3D &quot; ${@bb.utils.contains(&#39;=
MACHINE_FEATURES&#39;, &#39;gpu&#39;, &#39;egl glesv2&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt;&gt; +PACKAGECONFIG:remove:ti-soc =3D &quot;opengl&quot;<br>
&gt;&gt; diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-Open=
GL-disabling-patch-to-not-exclude-libepoxy.patch b/meta-ti-bsp/recipes-grap=
hics/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.pat=
ch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000..c873fb8d<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disa=
bling-patch-to-not-exclude-libepoxy.patch<br>
&gt;&gt; @@ -0,0 +1,46 @@<br>
&gt;&gt; +From eb16e80bf1f7c51024f3ed950ae85541e5ba2233 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" target=3D"_b=
lank" rel=3D"noreferrer">afd@ti.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 12 Oct 2022 13:05:45 -0500<br>
&gt;&gt; +Subject: [PATCH] Fix OpenGL disabling patch to not exclude libepo=
xy<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Inappropriate<br>
&gt;&gt; +Signed-off-by: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" tar=
get=3D"_blank" rel=3D"noreferrer">afd@ti.com</a>&gt;<br>
&gt; <br>
&gt; I think this is appropriate to fix upstream.<br>
&gt; <br>
&gt;&gt; +---<br>
&gt;&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">configure.ac</a> | 9 ++++-----<br>
&gt;&gt; + 1 file changed, 4 insertions(+), 5 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer no=
referrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.=
ac" rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt; +index 3cb24e9..aa365be 100644<br>
&gt;&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferre=
r" target=3D"_blank">configure.ac</a><br>
&gt;&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferre=
r" target=3D"_blank">configure.ac</a><br>
&gt;&gt; +@@ -348,10 +348,9 @@ AC_ARG_ENABLE(cloudproviders,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[cloudproviders_set=3Dyes])=
<br>
&gt;&gt; + AC_ARG_ENABLE(opengl,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AS_HELP_S=
TRING([--enable-opengl],<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [When enabled, Gtk+ will use libe=
poxy and exposes GtkGLArea widget ])])<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [When enabled, Gtk+ exposes GtkGL=
Area widget ])])<br>
&gt;&gt; + AS_IF([test &quot;x$enable_opengl&quot; !=3D &quot;xno&quot;], [=
<br>
&gt;&gt; +-=C2=A0 AC_DEFINE([HAVE_OPENGL], [1], [libepoxy and opengl APIs a=
re available at buildtime])<br>
&gt;&gt; +-=C2=A0 EPOXY_PACKAGES=3D&quot;epoxy &gt;=3D epoxy_required_versi=
on&quot;<br>
&gt;&gt; ++=C2=A0 AC_DEFINE([HAVE_OPENGL], [1], [OpenGL APIs are available =
at buildtime])<br>
&gt; <br>
&gt; This section can be changed to always define EPOXY_PACKAGES, or to<br>
&gt; define it when `--enable-epoxy` is passed on the command line if we ne=
ed<br>
&gt; a way to enable/disable this dependency to be able to submit the patch=
<br>
&gt; upstream.<br>
&gt; <br>
&gt;&gt; + ])<br>
&gt;&gt; + AM_CONDITIONAL([HAVE_OPENGL],[test &quot;x$enable_opengl&quot; !=
=3D &quot;xno&quot;])<br>
&gt;&gt; + <br>
&gt;&gt; +@@ -1365,7 +1364,7 @@ CFLAGS=3D&quot;$saved_cflags&quot;<br>
&gt;&gt; + LDFLAGS=3D&quot;$saved_ldflags&quot;<br>
&gt;&gt; + <br>
&gt;&gt; + GDK_PACKAGES=3D&quot;$PANGO_PACKAGES gdk-pixbuf-2.0 &gt;=3D gdk_=
pixbuf_required_version cairo &gt;=3D cairo_required_version cairo-gobject =
&gt;=3D cairo_required_version&quot;<br>
&gt;&gt; +-GDK_PRIVATE_PACKAGES=3D&quot;$GDK_GIO_PACKAGE $X_PACKAGES $WAYLA=
ND_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFIL=
ER_PACKAGES fribidi &gt;=3D fribidi_required_version&quot;<br>
&gt;&gt; ++GDK_PRIVATE_PACKAGES=3D&quot;$GDK_GIO_PACKAGE $X_PACKAGES $WAYLA=
ND_PACKAGES $cairo_backends epoxy &gt;=3D epoxy_required_version $CLOUDPROV=
IDER_PACKAGES $PROFILER_PACKAGES fribidi &gt;=3D fribidi_required_version&q=
uot;<br>
&gt; <br>
&gt; This line can remain unchanged if EPOXY_PACKAGES is unconditionally<br=
>
&gt; defined above.<br>
&gt; <br>
&gt;&gt; + <br>
&gt;&gt; + PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)<=
br>
&gt;&gt; + GDK_DEP_LIBS=3D&quot;$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB&quo=
t;<br>
&gt;&gt; +@@ -1399,7 +1398,7 @@ fi<br>
&gt;&gt; + PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)<br>
&gt;&gt; + <br>
&gt;&gt; + GTK_PACKAGES=3D&quot;atk &gt;=3D atk_required_version cairo &gt;=
=3D cairo_required_version cairo-gobject &gt;=3D cairo_required_version gdk=
-pixbuf-2.0 &gt;=3D gdk_pixbuf_required_version gio-2.0 &gt;=3D glib_requir=
ed_version&quot;<br>
&gt;&gt; +-GTK_PRIVATE_PACKAGES=3D&quot;$ATK_PACKAGES $WAYLAND_PACKAGES $EP=
OXY_PACKAGES fribidi &gt;=3D fribidi_required_version&quot;<br>
&gt;&gt; ++GTK_PRIVATE_PACKAGES=3D&quot;$ATK_PACKAGES $WAYLAND_PACKAGES epo=
xy &gt;=3D epoxy_required_version fribidi &gt;=3D fribidi_required_version&=
quot;<br>
&gt; <br>
&gt; As above.<br>
&gt; <br>
&gt;&gt; + if test &quot;x$enable_x11_backend&quot; =3D xyes -o &quot;x$ena=
ble_wayland_backend&quot; =3D xyes; then<br>
&gt;&gt; +=C2=A0 =C2=A0GTK_PRIVATE_PACKAGES=3D&quot;$GTK_PRIVATE_PACKAGES p=
angoft2&quot;<br>
&gt;&gt; + fi<br>
&gt;&gt; diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend b/=
meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000..b6e82d14<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend<br>
&gt;&gt; @@ -0,0 +1,9 @@<br>
&gt;&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI:append:ti-soc =3D &quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://0001-Fix-OpenGL-disabling-patch-to-not-exclu=
de-libepoxy.patch \<br>
&gt;&gt; +&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PR:append:ti-soc =3D &quot;.ti1&quot;<br>
&gt;&gt; +PACKAGECONFIG:remove:ti-soc =3D &quot;opengl&quot;<br>
&gt;&gt; +DEPENDS:append:ti-soc =3D &quot; libepoxy&quot;<br>
&gt;&gt; diff --git a/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbap=
pend b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000..aadf5bab<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend<br=
>
&gt;&gt; @@ -0,0 +1,3 @@<br>
&gt;&gt; +PR:append:ti-soc =3D &quot;.ti1&quot;<br>
&gt;&gt; +PACKAGECONFIG:append:ti-soc =3D &quot; ${@bb.utils.contains(&#39;=
MACHINE_FEATURES&#39;, &#39;gpu&#39;, &#39;egl&#39;, &#39;&#39;, d)}&quot;<=
br>
&gt;&gt; +PACKAGECONFIG:remove:ti-soc =3D &quot;x11&quot;<br>
&gt;&gt; diff --git a/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xor=
g_%.bbappend b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bba=
ppend<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000..86c1e714<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bba=
ppend<br>
&gt;&gt; @@ -0,0 +1,2 @@<br>
&gt;&gt; +PR:append:ti-soc =3D &quot;.ti1&quot;<br>
&gt;&gt; +OPENGL_PKGCONFIGS:ti-soc =3D &quot;&quot;<br>
&gt;&gt; diff --git a/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbap=
pend b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000..e7163207<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend<br=
>
&gt;&gt; @@ -0,0 +1,3 @@<br>
&gt;&gt; +PR:append:ti-soc =3D &quot;.ti1&quot;<br>
&gt;&gt; +PACKAGECONFIG:remove:ti-soc =3D &quot;glx&quot;<br>
&gt;&gt; +DEPENDS:append:ti-soc =3D &quot; libxshmfence&quot;<br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#15197): <a href=3D"https://lists.yoctoproject.org/=
g/meta-ti/message/15197" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://lists.yoctoproject.org/g/meta-ti/message/15197</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/93954566=
/6609808" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoc=
toproject.org/mt/93954566/6609808</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org"=
 target=3D"_blank" rel=3D"noreferrer">meta-ti+owner@lists.yoctoproject.org<=
/a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoprojec=
t.org/g/meta-ti/unsub</a> [<a href=3D"mailto:paul.barker@sancloud.com" targ=
et=3D"_blank" rel=3D"noreferrer">paul.barker@sancloud.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
Paul Barker<br>
Principal Software Engineer<br>
SanCloud Ltd<br>
<br>
e: <a href=3D"mailto:paul.barker@sancloud.com" target=3D"_blank" rel=3D"nor=
eferrer">paul.barker@sancloud.com</a><br>
w: <a href=3D"https://sancloud.com/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://sancloud.com/</a></blockquote></div>

--00000000000030ad8405ebf17548--


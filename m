Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5734EB64D7
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 02:43:32 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.218.1688006607800911703
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 19:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=L5DAkTYD;
 spf=pass (domain: foundries.io, ip: 209.85.167.42, mailfrom: ricardo@foundries.io)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fb8574a3a1so314436e87.1
        for <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1688006605; x=1690598605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JAwsyb3YbQBmZCQSADRiENuGfQ2/vg0YhrOj69tdy8=;
        b=L5DAkTYDMYRo80JO1cVo2k46LoyZnb5QRBNR7kbtBbQNuXK1w3b2Dc7zc2oT1+O9jI
         lsHQma75BQ9irXi0sMJ8YxdHRhU6PL0eaWRE2jZoK4BMBqzVGd/deK/aCxVu3aDQSMFG
         LGbaQYwNzJvRvi2i0v3Kazih+AjgnSgMggQwMPuj1ilaVSRfmk9uYOb1hmYOLFxRhm4F
         XiuAhkdM2W7Re6nbogQiUJs0pnU0BKka0S4wNcyMhEJVLm/RHWuTDLPwhNxio5rkafvK
         P3jMplADUIk7w4qnlTLjutZv1gUXXAaIDBZfR7uXr7NXjBv6qSJpw+v/mFxpnk6alGka
         s3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688006605; x=1690598605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JAwsyb3YbQBmZCQSADRiENuGfQ2/vg0YhrOj69tdy8=;
        b=kneGsIVmLSdkm0MNxI+0oDbGOKArBUAsurFlopp1acf/AvxfIg1erkuuurCDRf2h24
         KiwGTiA1iqvJmarfh5G20OEHS36r+EszxhfSLkhu1u0SfxNu7kJBVq+I0HuXgcgN5rgQ
         M/liZFyStbUyBx1lrkMZitDr7tldNGLACJq6mW+xzQpgQuSmnIYPzB34s5UXvL+0pb9d
         1kQ9x8Q+lRE4lKc648Ac6yerg5X3j8m5xfWFkWevudy+gIobd+D1i2KiTr7j4NqeOTRZ
         M1AGLbq+pr1ArUFn7/MC0h488Lcf6PMOYUM0DZy4LV0/Na/cDgiMq0hMwf0L76CNeME9
         QcYw==
X-Gm-Message-State: AC+VfDy5X3p7Jb77Ulgr+1C9CKE/0q9SEoude3/Lu5r5Ydf9BJna6u5J
	VLNC352jAXXtKZDddlV9uvSFaFAEwrEJgB1Ptx6G
X-Google-Smtp-Source: ACHHUZ7+VPZ+Y5kSIN1S1poZDh+Rf7LA2ZPcDRvSJZP+XZehQNM9TTqtFqfprLgbs7X4SVhdKGr/l141cIT0KqvvmO8=
X-Received: by 2002:a2e:90d4:0:b0:2b6:a084:b52d with SMTP id
 o20-20020a2e90d4000000b002b6a084b52dmr7315889ljg.29.1688006605151; Wed, 28
 Jun 2023 19:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230629012145.407276-1-ricardo@foundries.io> <f601ff40-4022-7a7a-cc3a-d0744bbd471f@ti.com>
In-Reply-To: <f601ff40-4022-7a7a-cc3a-d0744bbd471f@ti.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Wed, 28 Jun 2023 23:42:48 -0300
Message-ID: <CAAaKDhEtsqtR+OQurgnnqimopHgGDweCLaj3dZYYwytUcKp=dA@mail.gmail.com>
Subject: Re: [EXTERNAL] [PATCH] ti-img-rogue-umlibs: use image path to avoid
 local path expansion
To: Randolph Sapp <rs@ti.com>
Cc: meta-ti@lists.yoctoproject.org, jose.quaresma@foundries.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Jun 2023 02:43:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16800

On Wed, Jun 28, 2023 at 10:48=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>
> On 6/28/23 20:21, Ricardo Salveti wrote:
> > Provide a package file list based on the image path to avoid it later b=
e
> > expanded by using the host system path.
> >
> > Fixes a package QA error when files named similarly are provided by the
> > host system (e.g. /usr/bin/oclock is a match for /usr/bin/ocl*).
> >
> > Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> > ---
> >   .../ti-img-rogue-umlibs_23.1.6404501.bb       | 21 ++++++++++++------=
-
> >   1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-u=
mlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_23.1.6404501.bb
> > index c012859f..229fc081 100644
> > --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
3.1.6404501.bb
> > +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
3.1.6404501.bb
> > @@ -38,32 +38,39 @@ PACKAGECONFIG[vulkan] =3D ",,,${VULKAN_LIB_PACKAGES=
}"
> >   PACKAGECONFIG[opencl] =3D ",,,${OPENCL_LIB_PACKAGES},libopencl-rogue-=
tools"
> >
> >   def get_file_list(package_list_var, d):
> > +    import os
> > +    image_dir =3D d.getVar("D")
> >       file_list =3D []
> >       package_list =3D d.getVar(package_list_var)
> >       if package_list:
> >           for package in package_list.split():
> >               package_files =3D d.getVar(f"FILES:{package}")
> >               if package_files:
> > -                file_list.append(package_files)
> > +                for f in package_files.split():
> > +                    if os.path.isabs(f):
> > +                        f =3D '.' + f
> > +                    if not f.startswith("./"):
> > +                        f =3D './' + f
> > +                    file_list.append(os.path.join(image_dir, f))
> >       return " ".join(file_list)
> >
> >   do_install:append() {
> >       if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true=
', d)}; then
> >           for file in ${@get_file_list('GLES_PACKAGES', d)}; do
> > -            rm -rf ${D}/${file}
> > -            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> > +            rm -rf ${file}
> > +            rmdir --ignore-fail-on-non-empty $(dirname ${file})
> >           done
> >       fi
> >       if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true=
', d)}; then
> >           for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
> > -            rm -rf ${D}/${file}
> > -            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> > +            rm -rf ${file}
> > +            rmdir --ignore-fail-on-non-empty $(dirname ${file})
> >           done
> >       fi
> >       if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true=
', d)}; then
> >           for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
> > -            rm -rf ${D}/${file}
> > -            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> > +            rm -rf ${file}
> > +            rmdir --ignore-fail-on-non-empty $(dirname ${file})
> >           done
> >       fi
> >       if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'f=
alse', d)}; then
>
> Hey, thanks for the patch. I believe this patch I submitted earlier
> should also solve the issue you were facing. It's still in the -next
> branches though.
>
> https://lists.yoctoproject.org/g/meta-ti/message/16790

Cool, didn't notice this one, and yeah, should also solve the same issue.

Thanks!
--
Ricardo Salveti


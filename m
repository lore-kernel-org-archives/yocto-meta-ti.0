Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB0FEE00D6A; Tue, 16 Jul 2019 18:27:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D1D2E00B33
	for <meta-ti@yoctoproject.org>; Tue, 16 Jul 2019 18:27:33 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id z4so21710778qtc.3
	for <meta-ti@yoctoproject.org>; Tue, 16 Jul 2019 18:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=syQv7FoD1nFajzeceXDFFWKoAmDqsVqj758lMSvijsY=;
	b=l2ZgjHeZncpt/6nc3OXHDgeqeIJH89JcpYH7/H1GpP+kOOcXNYnC2xRgfNhufka6VS
	hI0mUb6JgwuFn2kgVYv1ei5vMsTjLf7ELcBfFxmaDOEupGI9JylNF/dZv89hEmvC/ufd
	d8uylsfLNzv9s9oGGf8iaDQ+uTYVt4m344Qv+vaQpd43hotI/JmwKhPnJFfUI3cQsXox
	Vr5octbS3Krfgxj2ufAQPNMH+Fw/trzqn+MAR6RsoZ7C7kktRRPIY8kQKt2RZjOfcUBq
	mb0jTFG4llVNq2bOuFqyyjshJf1n3WZQt7bO1RTyiZQvoNGujyIZtRrji2qdio7Z0vue
	K5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=syQv7FoD1nFajzeceXDFFWKoAmDqsVqj758lMSvijsY=;
	b=qf/0PtfQsBSZw4q7UbQKVA02e+sz8ST/L1OWTUEMs3nnjcdM2nv5TYp8d4+B+ACthi
	bzDeuQMpqSEfbISOEC3eH/bQSn6mo4TtLEp/4JNQMWd7H4QfNTybIydP807VDpiw8BBG
	WmN2mFHLI6rmr7wy1RXu8QpDRL6Dig07NjAw76rHiKQt7SiIwnjDVCuXjXcp5QamMpbs
	HF+/mBaBvVdJQ4hmkhVeOz9aMUDClF3BMBD+VefzajurpaGzNRNloSJM8/Xn682hwNTK
	unDnNcRTk4BgEK97nXmITsdkUL1s30CaSpTcckH0xBne/9RRSS6HJwvn3D6H4799E36J
	bquQ==
X-Gm-Message-State: APjAAAUEfQJS4BlsWRro+0SQ0x29VZxcmHNxKxC23OwzjsDIj5CnrXti
	ZOwwxYyJvsqZwN5iWA0TROJUgNPMDb5tnc2FBeL+/tt9
X-Google-Smtp-Source: APXvYqxo0t/nNb4H+oPhbqx2GgnSaYJ2NNNjbiwtKvl/NF8jMpJAmXaiTJTkeomSnF9hD5vpH+yFr36W75RZpSk5k9U=
X-Received: by 2002:ac8:1183:: with SMTP id d3mr24833122qtj.53.1563326853098; 
	Tue, 16 Jul 2019 18:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190713004324.12695-1-raj.khem@gmail.com>
	<20190713004324.12695-3-raj.khem@gmail.com>
	<20190715201225.GJ9038@beryl>
In-Reply-To: <20190715201225.GJ9038@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 18:27:06 -0700
Message-ID: <CAMKF1srgfZ2-=3xJ5L3AkqENfzPVxDfyODUpgYDAt+Lrh32CxQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/4] jailhouse: Replace tabs with spaces in python code
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
X-List-Received-Date: Wed, 17 Jul 2019 01:27:34 -0000
Content-Type: text/plain; charset="UTF-8"

Ok, thanks. it works.

On Mon, Jul 15, 2019 at 1:12 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> I had to do this one differently, all others are now in "next" for testing.
> Thanks.
>
> Denys
>
>
> On Fri, Jul 12, 2019 at 05:43:23PM -0700, Khem Raj wrote:
> > Fixes
> > WARNING: python should use 4 spaces indentation, but found tabs in jailhouse_git.bb, line 85
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-kernel/jailhouse/jailhouse_git.bb | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> > index 753664ed..db31bb7d 100644
> > --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> > +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> > @@ -82,10 +82,10 @@ do_compile() {
> >  }
> >
> >  python __anonymous () {
> > -     d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> > -     initrd = d.getVar('INITRAMFS_IMAGE', True)
> > -     if initrd:
> > -             d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> > +        d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> > +        initrd = d.getVar('INITRAMFS_IMAGE', True)
> > +        if initrd:
> > +                d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> >  }
> >
> >  do_install() {
> > --
> > 2.22.0
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


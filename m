Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19644E00BF7; Mon, 16 Sep 2019 10:03:53 -0700 (PDT)
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
	*      [209.85.222.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01109E006B6
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:03:51 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id u186so713697qkc.5
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fcw4vwIRf5SXJriy48RHVxfaAxI+6fMSY0GTyVfGBOg=;
	b=s+Ei+pWJhUp6qZVZBN/VoEpLH5yTYuMUefa1Kt6BDgbRLjseHAM0ZynQKC26J6CWrY
	HSND9i4mQewQCvx+ecqomkrbJ1vGXBQKXfim9UVvNbPTV9GjEAwP/rQyyELYC68X+ZnM
	tQUfID6CsM/MfRnAmdd55q+1wACe8ztt4DaSgAlSTz7ajEfu1VMfG2j4t8/p1SUT4IYk
	65gketF+Un6tfYbui80FvsH3Mse1vK3x7o1vUb/AUPoNuCCxNXar0MEvh59+tZTXces6
	EzHa+wwxRJ4uw2m7E35KQikQ5OWAgKgY36Dk1v/vXkwLaoQhE545gpWmDcFmBLaXpzOQ
	wSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fcw4vwIRf5SXJriy48RHVxfaAxI+6fMSY0GTyVfGBOg=;
	b=rcxzriWN62Os5uuZnkwMmso07IjoMQqG7BDXVkXAcC2b/hyRmIJMQIwm9YDT9kMIf5
	jlI+pH6eHTaxdfxsqXUFCizOL6Y6/d3hv8cv6PLjvUqAgYSNm4bFeCr6mbnaBP6GHzIS
	6e+Jr1nkk0uYbjm7vSXFHbiWjBLVwgjyGBAL62iuqRC7qzkVgVR/Jz0pCNW1OPXkcxm3
	1cO2fYQQpGoVkVyLeLdncLp3/tPR4JE1fjpLi7fe0zOLzkzahugQoOXXyklL2fefXf6U
	asoPJQpVX0ef7Zoi1lth99BLafzpk6XaUApakJD41qrJ9O4k8G88+MxCDKT8qeAnRvLf
	oD0Q==
X-Gm-Message-State: APjAAAWP98Sg236KS8zg7eqHs5xPVJ9OklyJgHIp1dEX7d/tyAFuc1yK
	K2YXIvBW6up/UkPg+NdCqypF8841o50aeyGLCX4=
X-Google-Smtp-Source: APXvYqwrV3T7JIlmFHJF0AWDB8pTReHJ6Tt6xL8vaQzFXmEcezHY2aeC806B5EQJKHAPqu0w+qvRkndUZKVe3flGL/s=
X-Received: by 2002:a37:6651:: with SMTP id a78mr1055287qkc.474.1568653430800; 
	Mon, 16 Sep 2019 10:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190914144326.2954755-1-raj.khem@gmail.com>
	<20190916165813.GD26975@beryl>
In-Reply-To: <20190916165813.GD26975@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2019 10:03:24 -0700
Message-ID: <CAMKF1so=3+1GvbFP7FvUi=YwnkDDgW=xpijiUPw97PbN7pS=3g@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] libion: Fix musl build
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
X-List-Received-Date: Mon, 16 Sep 2019 17:03:53 -0000
Content-Type: text/plain; charset="UTF-8"

I have submitted it https://github.com/glneo/libion/pull/1

On Mon, Sep 16, 2019 at 9:58 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> Khem,
>
> Thanks for the fix. What's the Upstream-Status: ? :)
> I guess "Pending" would be appropriate for now.
>
>
> Andrew,
>
> Would you be willing to take the change in, so we don't have to carry the
> patch in meta-ti, or do you see any issues with it?
>
> --
> Denys
>
>
> On Sat, Sep 14, 2019 at 07:43:26AM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...tead-of-__BEGIN_DECL-__END_DECL-macr.patch | 42 +++++++++++++++++++
> >  recipes-devtools/ion/libion_git.bb            |  4 +-
> >  2 files changed, 45 insertions(+), 1 deletion(-)
> >  create mode 100644 recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch
> >
> > diff --git a/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch b/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch
> > new file mode 100644
> > index 00000000..530c869e
> > --- /dev/null
> > +++ b/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch
> > @@ -0,0 +1,42 @@
> > +From 197e7bf9a20076c6564a860bd2215e8101ee4cad Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 14 Sep 2019 07:36:47 -0700
> > +Subject: [PATCH] Use extern "C" instead of __BEGIN_DECL/__END_DECL macros
> > +
> > +these macros are defined in sys/cdefs.h for glibc and this header is not available on all libc
> > +
> > +for glibc they are defined like below
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + include/ion/ion.h | 8 ++++++--
> > + 1 file changed, 6 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/include/ion/ion.h b/include/ion/ion.h
> > +index 81ab9cc..e95df4b 100644
> > +--- a/include/ion/ion.h
> > ++++ b/include/ion/ion.h
> > +@@ -24,7 +24,9 @@
> > + #include <sys/types.h>
> > + #include <linux/ion.h>
> > +
> > +-__BEGIN_DECLS
> > ++#ifdef __cplusplus
> > ++extern "C" {
> > ++#endif
> > +
> > + int ion_open();
> > + int ion_close(int fd);
> > +@@ -34,6 +36,8 @@ int ion_free(int fd, int handle_fd);
> > + int ion_query_heap_cnt(int fd, int* cnt);
> > + int ion_query_get_heaps(int fd, int cnt, void* buffers);
> > +
> > +-__END_DECLS
> > ++#ifdef __cplusplus
> > ++}
> > ++#endif
> > +
> > + #endif /* __ION_H */
> > +--
> > +2.23.0
> > +
> > diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
> > index 7c93ed3f..38ba9bd8 100644
> > --- a/recipes-devtools/ion/libion_git.bb
> > +++ b/recipes-devtools/ion/libion_git.bb
> > @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> >  PV = "1.0.0"
> >
> >  BRANCH = "master"
> > -SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
> > +SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH} \
> > +           file://0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch \
> > +"
> >  SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
> >
> >  S = "${WORKDIR}/git"
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


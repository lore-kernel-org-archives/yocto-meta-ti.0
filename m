Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 0A362E006EF
	for <meta-ti@yoctoproject.org>; Thu,  7 Feb 2013 00:53:19 -0800 (PST)
Received: by mail-ve0-f172.google.com with SMTP id cz11so2069483veb.17
	for <meta-ti@yoctoproject.org>; Thu, 07 Feb 2013 00:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=iUeQWJuIrTsitF9mYxNrJ68dWEbk0qAIlf4n32zm6iI=;
	b=uPGZne8q7Qrr1Udrew3RWqa5MhsYHnIMJcPiC+hvWYpMJWvuNl6jveZI7yzdPnj3j5
	2oUyZo+4h/WAXDyJO3bDQOcXTRsA0OtgwxqouY4z74AWkE4fT0ZhiZmJcmFIYaaQJAGR
	FE3VmlPOgVn5s1A3TkASAaaqx4aftJW9P+3pD28fXzOhHOvOhtTaFZrX2LnsoQdf2hgh
	PeFPMDwCdXsSKcMn5NYV7/o63E6lpoCE6hZy6pXKmLx1bNzpGWCnqccCE9OWHPokPjxa
	Azk+pap48ClvtR4NHxo2oCn3n2klmO3cBGLDQpXQUdxurJosH6nXk8MrxjmOWnWIQvJw
	u7TA==
MIME-Version: 1.0
X-Received: by 10.52.88.237 with SMTP id bj13mr497680vdb.75.1360227198899;
	Thu, 07 Feb 2013 00:53:18 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 7 Feb 2013 00:53:18 -0800 (PST)
In-Reply-To: <CALbNGRQ1+WTt4uekk4rPcnQzhZzwTzpCd_NkZTXfDjQb4Z9N+A@mail.gmail.com>
References: <1360133872-10658-1-git-send-email-fcooper@ti.com>
	<1360133872-10658-2-git-send-email-fcooper@ti.com>
	<CALbNGRR-qnMUwuVNfehbvJRU9MqP5+EZhhhYji48x7UQTkfhJg@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EEEE@DLEE09.ent.ti.com>
	<CALbNGRTz2rWBf3TCNziVM5dWOB1hMgTV=9O6w+vUZXDm+jd=4Q@mail.gmail.com>
	<CALbNGRQ1+WTt4uekk4rPcnQzhZzwTzpCd_NkZTXfDjQb4Z9N+A@mail.gmail.com>
Date: Thu, 7 Feb 2013 09:53:18 +0100
Message-ID: <CALbNGRSSsPvC8gRJ6nx0HjjQoPM1NBRoPNQFWBKrbqAz0hN54w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] omap3-sgx-modules: Add v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Thu, 07 Feb 2013 08:53:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 6, 2013 at 4:57 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> One - maybe stupid - question: Have you tested with latest oe-core -or
> do you have
>
> commit c753f9d59f4d0a5af4ea5deb6e2b9609e05314e2
> Author: Mark Asselstine <mark.asselstine@windriver.com>
> Date:   Thu Jan 31 13:31:03 2013 -0500
>
>     kernel: avoid copying unnecessary files during do_install
>
>     kernel_do_install() populates $kerneldir with files needed to build
>     external modules. To accomplish this there are several copy commands
>     to get source from the kernel source tree and build trees after which
>     a 'clean' is performed. Since we are copying from the build tree we
>     get about 1G of .o and .cmd files copied over only to have them
>     removed when we clean. This adds additional IO overhead as well as
>     overhead caused by pseudo. By avoiding copying these files in the
>     first place we get multiple gains:
>       * avoid initial copy
>       * avoid file deletes during clean
>       * reduce pseudo overhead
>
>     Additionally we are making use of cpio vs cp which tends to be
>     significantly faster at performing copies.
>
>     With these changes I observe a 15-30% decrease in the time to complet=
e
>     the do_install() operation on the kernel.
>
>     [YOCTO #3517]
>
>     Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> in your repo?
>
> Andreas

FYI: I removed meta-gumstix-community from my layers and ran

MACHINE=3D"beagleboard" bitbake omap3-sgx-modules

and get same:

| make[3]: *** No rule to make target
`/home/Superandy/tmp/oe-core-eglibc/work/beagleboard-angstrom-linux-gnueabi=
/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/se=
rvices4/3rdparty/linux_drm/drm_auth.o',
needed by `/home/Superandy/tmp/oe-core-eglibc/work/beagleboard-angstrom-lin=
ux-gnueabi/omap3-sgx-modules/4.08.00.01-r122a/Graphics_SDK_4_08_00_01/GFX_L=
inux_KM/services4/3rdparty/linux_drm/drm.o'.
 Stop.

so I think it is related to changes in other layers. Did you test with
master or danny?

Andreas


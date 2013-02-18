Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 8945CE006E9
	for <meta-ti@yoctoproject.org>; Mon, 18 Feb 2013 01:25:38 -0800 (PST)
Received: by mail-ve0-f177.google.com with SMTP id m1so4589576ves.8
	for <meta-ti@yoctoproject.org>; Mon, 18 Feb 2013 01:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=7MEm/HWaSryTPf/yIJz43D2h1uUqoHSpSgR4V5Mqfsg=;
	b=MiAV/ic+hvE60F9jG5HVOLdWBu2WoapOHbe4EmMhwIULjtlfZgW9FcHzsYy5yjeQkq
	1vekvSE3t6ztUp3fUgox7NMDDTz5fJyOIyOncRfBSSLDxLWvfXrtbSAGSfu8yJpfHAHu
	QjQzji7iHrywM+KtbcBczVpP5ki5RlmlTPSuMV6N0D478CK/dgUl8Mlq9QdszN2pfLTH
	CribR8ctt7FkcZLehGmxZaRI5qfMB6WUh3/RtASZHm9fJhWoSD/UqUiCTedwrqrqufxZ
	3Rd4b7bRJpuztB4dI+vYpprqTzw0E9S0kWtAeupW7RkhnWb/Iq1A7Mu15gap7feZBKUJ
	H8CQ==
MIME-Version: 1.0
X-Received: by 10.52.26.17 with SMTP id h17mr12612262vdg.101.1361179537191;
	Mon, 18 Feb 2013 01:25:37 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Mon, 18 Feb 2013 01:25:37 -0800 (PST)
In-Reply-To: <20130217234221.GE2174@denix.org>
References: <1360133872-10658-2-git-send-email-fcooper@ti.com>
	<CALbNGRR-qnMUwuVNfehbvJRU9MqP5+EZhhhYji48x7UQTkfhJg@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EEEE@DLEE09.ent.ti.com>
	<CALbNGRTz2rWBf3TCNziVM5dWOB1hMgTV=9O6w+vUZXDm+jd=4Q@mail.gmail.com>
	<CALbNGRQ1+WTt4uekk4rPcnQzhZzwTzpCd_NkZTXfDjQb4Z9N+A@mail.gmail.com>
	<CALbNGRSSsPvC8gRJ6nx0HjjQoPM1NBRoPNQFWBKrbqAz0hN54w@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C388EA4@DFLE09.ent.ti.com>
	<CALbNGRTnx5Tg8Vcme4eZ77bDSzwkaoHHuTa4C+z6tfM+bB4jwA@mail.gmail.com>
	<CALbNGRRt7QoifHFqQMDeSY7g2ABt15_KhgBos6ijwGbLAOcpPw@mail.gmail.com>
	<CALbNGRTbKfetZ3kDUnzFjx+cxM0O-mLob5HcjS4YMLmJ5DVyYA@mail.gmail.com>
	<20130217234221.GE2174@denix.org>
Date: Mon, 18 Feb 2013 10:25:37 +0100
Message-ID: <CALbNGRTBrT_NSpt+5c7mFWqsurAAdntZrwEwFiROs7ahQmq2aA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Mon, 18 Feb 2013 09:25:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2013 at 12:42 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Wed, Feb 13, 2013 at 11:43:34AM +0100, Andreas M=C3=BCller wrote:
>> On Tue, Feb 12, 2013 at 12:03 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Thu, Feb 7, 2013 at 5:25 PM, Andreas M=C3=BCller
>> > <schnitzeltony@googlemail.com> wrote:
>> >> On Thu, Feb 7, 2013 at 2:51 PM, Cooper Jr., Franklin <fcooper@ti.com>=
 wrote:
>> >>> Yes I've got this working for me on danny. However, I do use a non x=
11 build which is most likely the reason why I am not having this problem.
>> >>>
>> >>> A related thread about possible issues with x11 distributions
>> >>> https://lists.yoctoproject.org/pipermail/meta-ti/2012-September/0015=
02.html
>> >>>
>> >>>
>> >> Have fixed this - after testing I will send a follow up patch series
>> >> because I am really burning to see the X11 stuff...
>> >>
>> >> Andreas
>> > Aargh - during tests I ran into other issues with oe-core/meta-oe
>> > current HEAD so I can not do run-tests. Build-tested results are at
>> >
>> > https://gitorious.org/schnitzeltony-oe-meta/meta-ti/commits/sgx-test
>> >
>> > As soon as HEADS are back and build working images I'll return on this=
...
>> >
>> OK I managed to build and am testing now. When loading pvr_drv X
>> complains for wrong ABI (is 10 expected 13). Is there a version of
>> Graphics SDK available with support for xserver 1.13? I saw
>> v4.08.00.02 supports xserver 1.12. Are there any other sources for the
>> userspace-driver part?
>
> Andreas,
>
> I just pushed v4.08.00.01. Please let us know if you have any further com=
ments
> or patches.
>
> Currently, v4.08.00.02 has some issues compiling from the recipes, as
> historically recipes didn't use Graphics SDK's Makefiles - we will be
> reworking that soon. As well as we'll try to address installer's size iss=
ue.
>
> As of the xserver support - 1.12 from v4.08.00.02 is as good as it gets r=
ight
> now. While X11 support hasn't been the first priority for Graphics SDK la=
tely,
> that might change in the near future...
>
> --
> Denys
I got them to build for X with kernel 3.2 (begleboard) and 3.5
(overo). This you can see at [1] - but it needs some cleanup. More or
less accidently I found that much of what I did is already available
at [2]. As said - run tests failed due to mismatching ABI version for
pvr_dri. So I stopped further activities and wait for later SDK with
matching ABI.

Andreas

[1] https://gitorious.org/schnitzeltony-oe-meta/meta-ti/commits/sgx-test
[2] https://github.com/RobertCNelson/ti-sdk-pvr/tree/4.08.00.02


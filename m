Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C944E01396
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 04:15:41 -0700 (PDT)
Received: by yhfq46 with SMTP id q46so8154600yhf.35
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=O8zjwgeKpo46TebKil/F3cKt9TBaB90OtEeeP0c1+AY=;
	b=qvicAWJH3f/a2o94KybcWf+5Zi2zXeisPykCTdEwDF42ioAQjwuJkEeZwXn+zDBO/4
	ASnx1p0qKWnM2QwM2sW9KBjvNIe8lPVSJb+wb02rXv7KldMuBzz7DLnRFP8ww19ygVhR
	CuKuuK7HvS56mV8F5ygp9QZ6UbUgfIJfrb0i2XWjLPtxsUSMEsr005oR+sPgstSGLOg/
	0JojerCzNkZbigXERYSZcHJx4bWkXZIHiCT2zbDVwV5qFEVMznCMFfil8BWXaJczUPo/
	6xpIJCw6v7/Y+7dH3HBCKydSNt/5a9Cyw/pCUxBZsVca0v49I44HYbAJ6a7DPPTaxPBk
	rqZQ==
MIME-Version: 1.0
Received: by 10.50.154.169 with SMTP id vp9mr12352467igb.53.1337771739924;
	Wed, 23 May 2012 04:15:39 -0700 (PDT)
Received: by 10.64.141.72 with HTTP; Wed, 23 May 2012 04:15:39 -0700 (PDT)
In-Reply-To: <9FB288D3-4180-4AFB-9374-95A5CC27A54E@beagleboard.org>
References: <1337645555-1805-1-git-send-email-schnitzeltony@googlemail.com>
	<52E11F40-B7EF-41BA-B462-662DDE01C311@dominion.thruhere.net>
	<9FB288D3-4180-4AFB-9374-95A5CC27A54E@beagleboard.org>
Date: Wed, 23 May 2012 13:15:39 +0200
Message-ID: <CALbNGRTjFx7X8KjaSSpcLJTNdybh7SzYDh3L+nxgNdYSgXQM2g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-mainline: Add patches to enable libertas firmware loading asynchronously
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 11:15:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2012 at 7:48 AM, Koen Kooi <koen@beagleboard.org> wrote:
>
> Op 22 mei 2012, om 07:43 heeft Koen Kooi het volgende geschreven:
>
>>
>> Op 22 mei 2012, om 02:12 heeft Andreas M=FCller het volgende geschreven:
>>
>>> When using udev >=3D177 libertas driver does not load properly the firm=
ware [1].
>>> The patches 0001-0016 were taken from [2] and can be viewed at [3]. Pat=
ch 0017
>>> I created to fix compiler complaining for missing symbol is_interrupt w=
hen
>>> DEBUG set.
>>> The patch series was tested with meta-gumstix on overo with udev-175 an=
d
>>> udev-182.
>>>
>>> [1] http://www.spinics.net/lists/linux-wireless/msg85541.html
>>> [2] git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-nex=
t.git
>>> [3] http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-next.=
git;a=3Dhistory;f=3Ddrivers/net/wireless/libertas;hb=3DHEAD
>>>
>>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>>
>> Could you please add the patches to the 'upstream' of this recipe instea=
d? https://github.com/beagleboard/kernel/tree/beagleboard-3.2
>
> s/instead/as well/ of course. Time for coffee :)

How about the following deal: You or somebody synchronizes to latest
beagleboard.org changes ( 3.2.18 arrived yesterday ) and after that I
will rebase/test the patches and resend them here and to
beagleboard.org.

What do you think?

Andreas

[1] http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2012-May/006=
122.html


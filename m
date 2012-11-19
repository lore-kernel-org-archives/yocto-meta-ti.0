Return-Path: <cliff.brake@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20892E00348
	for <meta-ti@yoctoproject.org>; Mon, 19 Nov 2012 13:17:44 -0800 (PST)
Received: by mail-vb0-f48.google.com with SMTP id l22so4072477vbn.35
	for <meta-ti@yoctoproject.org>; Mon, 19 Nov 2012 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bQ+XKiq/QlRHYFZr4/jFv9KZQuCDy74xbK0hLRfS7EU=;
	b=NFMWoabp3JPrssbsOjM5VugRu2nCUkC018VnTfEUpKVzYFIZFqMmcLmGugisxhpSkZ
	MsNRszZ/QC+6ESHVFAqD/dp+6m/pdxy8B1NmBc3fkLTCz/QsAsJcQhwv8aESO/YZBWvn
	Vb9TBNDrSeriZ8WH9b9hXkyRYYwaRXc5W/O4VpAV1ZNkeSCfdixcBaPdAcQfFj8qYVcm
	U59Rl2IRs6b76GF/XMFA2fsLZUv9dtXkzRJxgtu0u52K5Xy3d+heYISCWvzBycYz9uwo
	9EmL095wn3aZdhsBiOl95GCODlAyd+mTMSRz+CYKkVao7QsIJmycuun+CaTLBWwExPCJ
	Ec+A==
MIME-Version: 1.0
Received: by 10.52.98.196 with SMTP id ek4mr18442201vdb.38.1353359863578; Mon,
	19 Nov 2012 13:17:43 -0800 (PST)
Received: by 10.58.155.199 with HTTP; Mon, 19 Nov 2012 13:17:43 -0800 (PST)
In-Reply-To: <CAAfyv373JT1hXJTSxL8CxmoyMLFzqRREk-Bha+ahEQPL+UwVgw@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
	<CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
	<CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
	<CAOd_LFxPVW1Sx-4H4jhbu=40HB6_uZe6CvUOCPQe_xKTd-NsLQ@mail.gmail.com>
	<CAOd_LFwQKyo4Fggo=+WmokUFQPX=HSjuGhA66WpbL3YJrnLAPw@mail.gmail.com>
	<CAAfyv373JT1hXJTSxL8CxmoyMLFzqRREk-Bha+ahEQPL+UwVgw@mail.gmail.com>
Date: Mon, 19 Nov 2012 16:17:43 -0500
Message-ID: <CAOd_LFwYn0jYTua7S5TWkWAg76_v9p9ZOoaODyOjvhvyu4OVdg@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Belisko Marek <marek.belisko@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: which kernel for pandaboard?
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
X-List-Received-Date: Mon, 19 Nov 2012 21:17:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 3:29 PM, Belisko Marek <marek.belisko@gmail.com> wrote:

> Can you please share how to build mainline kernel in yocto. I try
> build meta-ti pandaboard kernel
> but there was an issue with fetching git kernel tree.

Currently, I'm building test kernels outside OE, so I just use the
toolchain from OE (can be set up with something like
https://github.com/cbrake/oe-build-core/blob/master/envsetup.sh), and
then my kernel defconfig changes can be found here:

https://github.com/cbrake/linux/tree/2012-11-19_pandaboard

Thanks,
Cliff

-- 
=================
http://bec-systems.com


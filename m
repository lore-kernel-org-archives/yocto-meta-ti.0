Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBF55E00A49; Mon, 16 Sep 2019 08:38:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9557BE00942
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 08:38:15 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id q64so333260ljb.12
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MIGxvoZms+gvQNRP20aXRzJJRAaynUbGpBIULIrVYcQ=;
	b=TKJoA4/DHatmahlbRD5aMNpNoUUlbV14oIwvRiiiwUBhRInHzg9LCYsJakOhT+TKxy
	uVRiZyrIAzs034tXIWFAGom9rThGxuM/XJek0t6tecdn6z97u1TfcY9NhKVo2ii0hBYS
	i8cNKPdMvxZbcpXdhBXh1CGMcD2OxT+s2OATxMGG2jGRoDx73GGoRFN3eOlShxIUVWnx
	p9ofPr4WOvTGNursTM+5TVOmVTcwZIQwIx9n/9AlsePuYED0ADwIJ3MRwQ1GIPj0Fl+P
	YbS0gBisneUyDtlt3Zmo38qA5tAiWvQhhCFklWeUMOp722l+0Mv3uBU0gviHFJbBewJD
	vo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MIGxvoZms+gvQNRP20aXRzJJRAaynUbGpBIULIrVYcQ=;
	b=hTjDxhXUp7RNJel7LSASor3eAX/fjLfUagPT5awDg9ilArvekBsoOiE/VDEaLBEBdx
	aRr7Rx9dsk75CU7tSdGpOrJFfvsCsEl6iWvjM+vZcbozySdYuf+xdBMOW4MMwy1ANnMd
	RaSxP6yX64YmqiV/jeYyB0jvx0bGRoj59nXd/kr/phlmsXPTCUaqpcGQkWxglW7Zfax6
	WDqNRntEX3/CJdmC8rQxFD9qdJoixeKoT6qedfaelcuvIWNal6pF9F/4Cs2HaZhmwcNi
	AGVJjQm//V4udQ7T5mCDs5k6aXL7fAh0bPAfgSVMMQ+Hl/Z2yV3cDkrED8/PEmJMRX9b
	tUUg==
X-Gm-Message-State: APjAAAW/weqs+NMwlAMBoDbDtZQhunNzRxXW1kRPTspykHjfJTFy75Nf
	y9Q+nZ7dNRRAJuhl/80bxeZvR6Fw8MaVXXuM/+U=
X-Google-Smtp-Source: APXvYqzaZVc6S35ypeYI2490Pb2UWB9fr6gBmx/4knrBq6vh0n843LrSSbpIXbhFZxwpbADJalzUVUOk/0jyRACKkqw=
X-Received: by 2002:a2e:551:: with SMTP id 78mr170872ljf.48.1568648294418;
	Mon, 16 Sep 2019 08:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190914135151.3619-1-afd@ti.com>
In-Reply-To: <20190914135151.3619-1-afd@ti.com>
From: Robert Nelson <robertcnelson@beagleboard.org>
Date: Mon, 16 Sep 2019 10:37:47 -0500
Message-ID: <CAOCHtYjjRM5LDKrQgU9nYaAEo4TZP82Xpw-RzDez8G0_tTuQgQ@mail.gmail.com>
To: "Andrew F. Davis" <afd@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [master][RFC] Mesa recipie now provides GL frontend libs
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
X-List-Received-Date: Mon, 16 Sep 2019 15:38:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 14, 2019 at 8:52 AM Andrew F. Davis <afd@ti.com> wrote:
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>
> Hello all,
>
> This is a preview change of our GPU driver stack. Mesa can now used to
> provide the GL frontend libraries (EGL/GBM) for our SGX based systems.
> This greatly expands our supported extensions and improves compatibility
> with software designed to work with Mesa and Mesa provided tooling. The
> existing backend is now confined to just a DRI backend used to provide
> the GLES1/2 functions. The extensions/compatibility on this part of the
> stack will not change.
>
> The Mesa-side-glue to interface with the SGX DRI blobs is currently
> internal only until we can find the right way to distribute the patches
> (recipe patches in meta-ti or as a fork of Mesa hosted on git.ti.com).
> Currently they are on my internal only bitbucket, so those outside TI
> will not be able to test just yet :( but can review this recipe patch
> just the same.

Count me in! This looks awesome, we'd like these for BeagleBoard asap
Pretty Please! ;)

Regards,


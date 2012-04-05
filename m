Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BCF7E0044A
	for <meta-ti@yoctoproject.org>; Thu,  5 Apr 2012 12:15:55 -0700 (PDT)
Received: by bkcji17 with SMTP id ji17so2150224bkc.35
	for <meta-ti@yoctoproject.org>; Thu, 05 Apr 2012 12:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PTFqX4piOUeczV6WZgryr2JjAbHoBXOXPUd5ml0JJBo=;
	b=LVqez1qjyOw0aird4/2uyIHmF+DZ77ar3Dk1oKhx5lR0s5ho7gAOAye+6e2Lg4riO3
	ak1jb81axiwKv99MtIpwpm9ifs6yZOC+oy87g6Ncx6Pf9nWIunVyNGEFZ+jlDhZKZkT2
	SIqs72qiDMUNoVyEoX0YL3TrwClrtNDj+IC9eRlgQlk9LO6mPzEX6WGBEbYNt3gcivqC
	QM3ToLFYZo3mhunKVzSYRzeKNiRoTxZUCXtEJdcqYJs4l5Qjsdj5dKNTD3mOEwoOopwL
	p3gJwfAzRPh/plQN2VS/mAbYHZK3Y8aE6Wa+SGRRMMrS8KP8rtJGJKQP6h17Zw9SO74b
	wRlQ==
MIME-Version: 1.0
Received: by 10.204.149.218 with SMTP id u26mr1810979bkv.82.1333653354834;
	Thu, 05 Apr 2012 12:15:54 -0700 (PDT)
Received: by 10.204.149.195 with HTTP; Thu, 5 Apr 2012 12:15:54 -0700 (PDT)
In-Reply-To: <20120405190704.GA5144@denix.org>
References: <86pqbmm4oe.fsf@coulee.tdb.com>
	<CAFZh4h9hFiRTRhVK_BfxfhFWhmZSinKjC5NJBq=ncubqboyvBg@mail.gmail.com>
	<20120405190704.GA5144@denix.org>
Date: Thu, 5 Apr 2012 15:15:54 -0400
Message-ID: <CAFZh4h_Dn0tWdsxtiSdRFzLpF7dF4OqCHMV4FqqG2QRZfBLdCw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: building meta-ti + poky HOWTO?
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
X-List-Received-Date: Thu, 05 Apr 2012 19:15:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 5, 2012 at 3:07 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> You shouldn't be using BeagleBoard kernel images on the BeagleBone. You might
> get very basic ARM support, if you are lucky, but otherwise it won't work.
>

Sorry! For some reason I thought early on the beagleboard images would
work.  I've actually not built anything from scratch for my beaglebone
yet.  But I can say the BeagleBoard image built by poky works without
meta-ti.

Russell, if you search the archives you'll see about a month ago some
folks (James Abernathy comes to mind) were having a discussion on how
to work around and get meta-ti working with poky.

Regards,

Brian


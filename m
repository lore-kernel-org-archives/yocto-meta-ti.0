Return-Path: <twoerner@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC9ECE01404
	for <meta-ti@yoctoproject.org>; Fri, 11 Jan 2013 05:38:55 -0800 (PST)
Received: by mail-we0-f172.google.com with SMTP id r3so866237wey.3
	for <meta-ti@yoctoproject.org>; Fri, 11 Jan 2013 05:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sBgOLJe9osJWjQ4LDVtRuvCQfcXAnorqnpnGgWGvaQM=;
	b=CfmjHrP4HU06t28emwj+KTOaB6FARYY3rQiv0NgwjMUns7NPuwHXu6LCD0tCTQHC67
	3+VJQJrY1OxSVcg/fS8lZqoS7N5HN+3u8DuZNgqXoxR5D5KRAjGdWeFp164a9s0Fveg2
	t9Lozpo91tzWnh+ZQrD+P7+AxiUa3Vuwact7uKAOBSlMG1bBkhfbo+DrCBzblfVssN6l
	zoWmXoZLlrnMQjGtBjKTRvTBjNXIWe6OKdzBeBY7a8CSXPX10T/VNSbUkVNndc8MBo/4
	SOg8Jdq8a4ApcsLF2+B7BMJitP3nkdkkMXpOydMBf0wYH3s4/MXls2lRKs8HIBzAl4y5
	eoyA==
MIME-Version: 1.0
Received: by 10.180.73.80 with SMTP id j16mr15419311wiv.5.1357911534501; Fri,
	11 Jan 2013 05:38:54 -0800 (PST)
Received: by 10.227.132.205 with HTTP; Fri, 11 Jan 2013 05:38:54 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301110652110.10214@oneiric>
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
	<50EED938.8080108@mlbassoc.com>
	<alpine.DEB.2.02.1301101008200.7994@oneiric>
	<CAHUNapRvWWZNuGOfwnfAymhSoApc0_Y29CT8=S19cdBBkRvZCA@mail.gmail.com>
	<alpine.DEB.2.02.1301110652110.10214@oneiric>
Date: Fri, 11 Jan 2013 08:38:54 -0500
Message-ID: <CAHUNapTjs40mrSvqtKm-=x=kOUPQvVjOStKwj_tLZgu-rvNphg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: meta-ti@yoctoproject.org
Subject: Re: has anyone actually tested sdcard_image.bbclass?
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
X-List-Received-Date: Fri, 11 Jan 2013 13:38:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 11, 2013 at 7:02 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   so, is it fair to say that that's a bug in sdcard_image.bbclass?
> or is there something else that needs to be adjusted?


Yes, I would say there most certainly is a bug since, as you point
out, bitbake can't even parse the recipes correctly without throwing
an error (which is exactly the error I saw too).


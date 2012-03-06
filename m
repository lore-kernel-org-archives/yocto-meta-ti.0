Return-Path: <lazy.gopher@gmail.com>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0F57E0070C
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 00:39:12 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so3984020wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 06 Mar 2012 00:39:11 -0800 (PST)
Received-SPF: pass (google.com: domain of lazy.gopher@gmail.com designates
	10.216.137.74 as permitted sender) client-ip=10.216.137.74; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of lazy.gopher@gmail.com
	designates 10.216.137.74 as permitted sender)
	smtp.mail=lazy.gopher@gmail.com;
	dkim=pass header.i=lazy.gopher@gmail.com
Received: from mr.google.com ([10.216.137.74])
	by 10.216.137.74 with SMTP id x52mr5646199wei.77.1331023151706
	(num_hops = 1); Tue, 06 Mar 2012 00:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uPU9hES2yKQPg6udh5WxAqWFgPRZeHKjARkcw1z7S1k=;
	b=A8GYrJIvJeEFjCYt2P+dnhQQfKj0267efcOg9IeJHOre1NgrObjCOW0xlGg2c/zI+E
	HsB6sOU4S5gJzWfcU8OmdiFJulIh5MB+cYGJMp3idPVI4qMXMfSGQck8fA/79/zLEM9t
	VE3YyPyvwCHQRTG8tfccMNPF48oVnqeOM2h9/Cs7iRIVfI9TF9w4PLHCTP5jkcAxoCmZ
	CBt9B+MFaPAYBj2szzZCdNwJJWIvotLNoEeiw86vc2SK9tNz4wZ0t17IucjLMUfUErZT
	f5kcbu1ECGbiDMVv/kwV0EaTpm6Os2/8doepcHbdmMOZG5zUNpaTZ9ZpeRRZCSJitho5
	wjxQ==
MIME-Version: 1.0
Received: by 10.216.137.74 with SMTP id x52mr4564716wei.77.1331023151616; Tue,
	06 Mar 2012 00:39:11 -0800 (PST)
Received: by 10.223.72.193 with HTTP; Tue, 6 Mar 2012 00:39:11 -0800 (PST)
In-Reply-To: <20120306005241.GF2030@denix.org>
References: <20120306005241.GF2030@denix.org>
Date: Tue, 6 Mar 2012 09:39:11 +0100
Message-ID: <CAHQk_ARKgZ1_ZtJs46NWnvy-+v2oCvwQcJGPiWeyZbginCxS+Q@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: Fw: OpenEmbbedded as a test suite next steps
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
X-List-Received-Date: Tue, 06 Mar 2012 08:39:13 -0000
Content-Type: text/plain; charset=UTF-8

Hi Denys,

> items there, that we can help with - such as selection of the platforms with
> recent kernels and possibly cloud builds... Any thoughts?

some time ago I was toying with idea of testing OE builds on Amazon EC2
and even written HowTo. It's for classic OE (Angstrom actually), but
it can give you some ideas
and performance numbers.

http://www.openembedded.org/wiki/EC2CloudBuild

Hope this helps,
Maksym Parkachov.
http://veter-project.blogspot.com/


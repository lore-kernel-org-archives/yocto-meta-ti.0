Return-Path: <twoerner@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83DEDE004AB
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2012 09:26:07 -0700 (PDT)
Received: by vbme21 with SMTP id e21so1749342vbm.35
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2012 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dsrLFS5Uxrkvk2t8JPzazF4QW+W9jceiYZM28UZ7SOE=;
	b=YWyzDbNGXkqmTqNh1RUBxLGjaRJxQ40qeWzijwYcdLABaO7s541HFKt8EC2JQ3nuZS
	yS+sHhBwNSInHPBHN+VqnamtVPyOiLz3y4J+goTi9u0rvVexVOIKMrpcCT0slCVycsKG
	d6XU7b7MavgUPCnlZs8jra6cnZqCIyEy/ruT61ywsCF5h9wCaeI8U5MgZ9WCyaupcQ6J
	/eC9xgNvBZSBgODHgu9IRr9CFZ4P1FFZXDAJHYQttqK5zngH6iDe/qHFU/JKTKfe3VC/
	QYPXvRFl1bdLMoX6Hhch9JKBPpKbsS0mU9kx1zfQES2eLJxcpf1vLaJ6WLFH9An8j6NB
	M3Ow==
MIME-Version: 1.0
Received: by 10.58.69.38 with SMTP id b6mr2291079veu.30.1348071962741; Wed, 19
	Sep 2012 09:26:02 -0700 (PDT)
Received: by 10.220.236.201 with HTTP; Wed, 19 Sep 2012 09:26:02 -0700 (PDT)
In-Reply-To: <CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
	<20120919135659.GA589@edge>
	<CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
Date: Wed, 19 Sep 2012 12:26:02 -0400
Message-ID: <CAHUNapScsi7P8sfNSUgJdsdnoxt7U9y87iebu7pD_tPNXUSV0Q@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: building yocto images with meta-ti
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
X-List-Received-Date: Wed, 19 Sep 2012 16:26:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 19, 2012 at 12:04 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> is there a good wiki / doc that explains what each of this thing is:
> OE vs poky vs yocto vs arago?

Chris Hallinan has a blog post that might be helpful:
http://blogs.mentor.com/chrishallinan/blog/2012/04/13/yocto-versus-poky-versus-angstrom-etc/


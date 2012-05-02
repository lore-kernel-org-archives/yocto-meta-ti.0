Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90272E01402
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 05:50:25 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so3986673wib.11
	for <meta-ti@yoctoproject.org>; Wed, 02 May 2012 05:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7Emefb/Te3C/RcECeFs18A9SdOHuy4iIRnwpv27Ds+Y=;
	b=e3l8dy4AkFsAi7TqoVXQ1jzZkcwJ5F+hz7/sdcB67ihVBC0BSmlz7J9EyD1UBK8+TL
	wIXklbZPTNJGQoFt9ruHZKsuARYvi9+qmFQynODxsHXk7OEF4/OSNyFE/uCKY8dzWTjx
	sZkO2LpLbnnuiMfQeXbOqhvjI9w5paJtKO970tGi3uKk5nQC1/R7vdVYDX8u9yftO9fh
	aa+6mrZGqfj6hDsGLHLAVxnQ4hp5A+Tn64Hbrh5IdDqaWoEWUV40L7fim35Wyxu0JOxJ
	raGkr9bneDs28CLTQi5haem7QmZ5gqkHwQIKi7sxlkvhUiYY4mbxOgDUNXokRSwIOWst
	fANA==
Received: by 10.180.88.169 with SMTP id bh9mr218256wib.5.1335963024599;
	Wed, 02 May 2012 05:50:24 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm44055565wie.9.2012.05.02.05.50.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 05:50:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1335962006-27727-4-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 2 May 2012 14:50:11 +0200
Message-Id: <579E347C-A5A3-428D-8D3C-AE971F82FA0E@dominion.thruhere.net>
References: <1335962006-27727-1-git-send-email-koen@dominion.thruhere.net>
	<1335962006-27727-4-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkPeFwTkNru4vXNHcBT0QmxrdHiA/quypVvNSf7nfQH02GiMYDKYi21I7WM8PMKOcMaBi+B
Subject: Re: [PATCH 4/4] libgles-omap3: work around bug in opkg
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
X-List-Received-Date: Wed, 02 May 2012 12:50:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mei 2012, om 14:33 heeft Koen Kooi het volgende geschreven:

> All the EGL_BADALLOC failures that user have been reporting turn out =
to be a bug in opkg: =
http://groups.google.com/group/opkg-devel/browse_thread/thread/741d18b0ef3=
1435e#
>=20
> Opkg decides to relink symlinks to the wrong files. As a workaround we =
check the symlink during every bootup and fix it if needed.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Patch 3/4 work around this problem as well, but this avoids the =
potential problem when all packages are installed and you upgrade them. =
Not sure of that will trigger the bug, but better safe than sorry.
Stupid thing took 2 months to track down!

regards,

Koen=


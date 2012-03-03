Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6C2FE0070C
	for <meta-ti@lists.yoctoproject.org>;
	Sat,  3 Mar 2012 11:01:21 -0800 (PST)
Received: by wico1 with SMTP id o1so822586wic.26
	for <meta-ti@lists.yoctoproject.org>;
	Sat, 03 Mar 2012 11:01:20 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.132.30 as permitted sender)
	client-ip=10.216.132.30; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.132.30 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.132.30])
	by 10.216.132.30 with SMTP id n30mr277879wei.52.1330801280502 (num_hops
	= 1); Sat, 03 Mar 2012 11:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ECUaL4WgUUiMQ3+TiEbTAN3OIGPL4W96bMicqcVokhU=;
	b=RNjZlag+AosSlMx5bYFN24gUcf94zEAj++Z1CIuwEITGQuUGWz7C6oWyWRuf2DKnxV
	whdnFAjfV7rnPz7X1KxTvgfGBOK0Tw8QPp4rPLyUtdEzj3wOgePHReLH97d1xHSjRqnJ
	oX/3HTRQjh7cL9Kf6bJeWj49kchC+rY8QNs6vgwRQuNzpRFeowbrR73QtePTI/KNQ5Bf
	DJczze3yY9hmKdFdqN35+YxiZv5U8eyUigG4QZVLGbZxwscy5ZfpNo6Y5OKZgHoYhW16
	KksYa2OM3+huXK3NpBjMWtjeMS8JZfuTiRvDKkuuHhDOkqOVuVevPSRaiJ3ESlPUTnhT
	tOtA==
Received: by 10.216.132.30 with SMTP id n30mr220895wei.52.1330801280437;
	Sat, 03 Mar 2012 11:01:20 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm10880924wiy.7.2012.03.03.11.01.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 11:01:19 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120303135523.GJ24667@denix.org>
Date: Sat, 3 Mar 2012 20:01:17 +0100
Message-Id: <95AEAC88-7C37-41CD-B0FA-DF85BE77D2FC@dominion.thruhere.net>
References: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
	<20120303135523.GJ24667@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn5L85ll2sY6tvRGLKskk3MKT9DTgYVeL8v2aNyA4feHkS1PCfzBYqq0CTY7HKm/W+NV11/
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/3] SOC_FAMILY: add to MACHINE_OVERRIDES locally
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
X-List-Received-Date: Sat, 03 Mar 2012 19:01:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mrt. 2012, om 14:55 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Sat, Mar 03, 2012 at 11:53:06AM +0100, Koen Kooi wrote:
>> This breaks the hard dependency on Angstrom for getting a sane set of=20=

>> recipes.
>>=20
>> The variable name is kept the same and the actual code moved from=20
>> angstrom.inc to soc-family.inc to make it clear what it is doing and =
how.
>=20
> Ah, nice workaround until/if it gets accepted upstream to OE-Core! =
Thanks,=20
> Koen.

The consensus at ELC was that these kind of tweaks should be done at the =
machine level now that we have MACHINE_OVERRIDES seperated out. If a lot =
of BSPs are going to use SOC_FAMILY we can try to push it into OE-core =
again. But currently we wouldn't stand a chance.

regards,

Koen=


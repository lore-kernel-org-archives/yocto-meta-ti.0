Return-Path: <johnsonthomas@nanometrics.ca>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B882BE007F7
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 09:36:30 -0800 (PST)
Received: by mail-ve0-f169.google.com with SMTP id c14so5610497vea.28
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 09:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=neiGYp8Phetc+H8yHgy74dP5u2jldg0HgJAOA5ZsGkE=;
	b=EeTsBW1mU68wYpxFb+9ydSFt2pL5+CUTI7TgrWte8L21UgVmaFbY72XbnN2AOdxgz1
	VALmR9LwuGBcFnvtXFUn9k8KvFz3rZUjwijzOlN+MjSFlN3gNdxOBY9/R2NaIOzLMq3W
	CH9qz+WB+yiG/Pnq7GOMxJrigWm3qYu4sjdQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=neiGYp8Phetc+H8yHgy74dP5u2jldg0HgJAOA5ZsGkE=;
	b=Gmdsi77CjRntVlk1LBI1yBWYBPs1nqXG1ftQngz+N/GJB18438KYGAfuq2ZaO87ZRv
	Y7W8ngsJFYfOaP1I66dSoVqP2FKeFZtlHxTD8Cpc8rAlsXVMhta014gnS8E8NEEuGEVt
	Mhebec3swJM9d4TUGaBzqxoGUz3a/YcNppK5JlM6xqjV8cMT3zIxjjX/zihwnMRVnoaV
	E5E+R3iLlW1KaGlsP/+bst1hTQLU/N7yY9eLVpbb7GJe/uwnkH+htrxJGw1kut+RYY2b
	hkfokmRKUF8Ddlcy7gNNw+U8AbYNyWfIM2JUVfIw6Sgdjaj45IdLJooLPgcI8S39fWfo
	lrWg==
X-Gm-Message-State: ALoCoQlmR5KvLpUjpxU+rPg8fIZcUsN/zHohZCYj1uejVn+MmCKVvLwTFkm4SvtevdRcJX9VlzUZ
MIME-Version: 1.0
X-Received: by 10.221.60.134 with SMTP id ws6mr781413vcb.44.1387388190031;
	Wed, 18 Dec 2013 09:36:30 -0800 (PST)
Received: by 10.52.34.197 with HTTP; Wed, 18 Dec 2013 09:36:29 -0800 (PST)
Date: Wed, 18 Dec 2013 12:36:29 -0500
Message-ID: <CAL58Aehin5=s1tCLoonZScAQvq2Hp7nwb8zzc4TBpXTSVWfp+Q@mail.gmail.com>
From: Johnson Thomas <johnsonthomas@nanometrics.ca>
To: meta-ti@yoctoproject.org, jamesnuss <jamesnuss@nanometrics.ca>
Subject: Latest version of Poky compatible with meta-ti
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
X-List-Received-Date: Wed, 18 Dec 2013 17:36:34 -0000
Content-Type: multipart/alternative; boundary=001a113393a43b953504edd27cb4

--001a113393a43b953504edd27cb4
Content-Type: text/plain; charset=ISO-8859-1

Hi all.

I have a Yocto project consisting of Poky (Danny-8.0.2), meta-ti (tag:
ti2013.04.00) and a custom BSP layer. I was looking at upgrading the Poky
version to maybe 9.0 or even 10.0. I was wondering, what is the latest
version of Poky that is compatible with meta-ti layer?. Also, is it
recommended to use the "Danny" branch as a stable version for meta-ti layer?

Thanks,
Johnson Thomas

--001a113393a43b953504edd27cb4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Hi all.</span><div style=3D"font-family:arial,sans-serif;font-size:13px">=
<br></div><div style=3D"font-family:arial,sans-serif;font-size:13px">I have=
 a Yocto project consisting of Poky (Danny-8.0.2), meta-ti (tag: ti2013.04.=
00) and a custom BSP layer. I was looking at upgrading the Poky version to =
maybe 9.0 or even 10.0. I was wondering, what is the latest version of Poky=
 that is compatible with meta-ti layer?. Also, is it recommended to use the=
 &quot;Danny&quot; branch as a stable version for meta-ti layer?</div>
<div style=3D"font-family:arial,sans-serif;font-size:13px"><br></div><div s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">Thanks,</div><div styl=
e=3D"font-family:arial,sans-serif;font-size:13px">Johnson Thomas</div></div=
>

--001a113393a43b953504edd27cb4--

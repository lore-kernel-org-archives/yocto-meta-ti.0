Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CE11E00E96; Fri,  9 Feb 2018 12:27:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (adam.yh.lee[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.181 listed in list.dnswl.org]
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 263FCE00B66
	for <meta-ti@yoctoproject.org>; Fri,  9 Feb 2018 12:27:00 -0800 (PST)
Received: by mail-yw0-f181.google.com with SMTP id v139so5971181ywg.4
	for <meta-ti@yoctoproject.org>; Fri, 09 Feb 2018 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=wWAkeg4iQt26pak0pcm12UBowwEPea/3tUwn+CYzW60=;
	b=Eku7w5irg+GbqdGd9Fr+WAYf0xMk/Odzoav+0gzHQmnx6MHwvzVdVP3Q9i+Hqgoalf
	WlhtYFKGlGYpqPmz23KFp9tmf9UH+8CBt0uhATDqxKAsNTE6Mne/fwAoHZPYsEm0zRxd
	z/xrd6JiHmL9KjJO91zUJH5zP/2h7+ZFBWKag13KXQV1TAytdHyGBkIGNJfhLW9tzOiZ
	diye0NQsfohjGVtF8F6z7/1qS4DKcZuHjq0ExArH8wToDflG3bJ3UAYt0bgrvGJ3LW95
	2Z9rX4yWd9+J+huVMWfMwz+zX30EhmYMpHuIXersjiBebz0vbW1GBPhD7ViUnEg2o/8R
	Cu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wWAkeg4iQt26pak0pcm12UBowwEPea/3tUwn+CYzW60=;
	b=O56KOhR0o8tD92p3KVmpT73+xVWy7zEZvvQq30CFCtlFd3sCfje9teNR054HHUEYpg
	hHnUHTPSvStehhV7oGPYYiQQk627YBJzsrAdDz0XWxylsNoqnMBpg+nCByarl9k93LFa
	shVxIWoXUMG7nANWGacY5oCIud1IYecFB55kyYslW+W4JfZzoxsEkqODuf5quxBz4U0l
	dSe1X0AKT+gBqhUvY2rX4DMocjdRi2QZ/NKHP/fu44gBQYW7VjrumFD4UtB62a+NQnii
	ckGZtUZizP/FJPz6BYF9/x29ohbcF1jwq+fEb7J5KYR1OWycnHBjpP/Td3oht12gGJfc
	WQmQ==
X-Gm-Message-State: APf1xPADYT4laMtVOz6pYD9n7VMc1oWehkjHaDr82RmknZ7pNzp/LHsC
	uRO1rUjPeDduSieTfxylTaIvVr3fZTa7aZ02oNg=
X-Google-Smtp-Source: AH8x225JBD2fS80LXTawTBVIb1Wv7vuYjqUBoVK34H6VBvMVXMZGhbgIj/q23aOCOVlWuXCq0rsXyRaIPsKbza1lP+c=
X-Received: by 10.13.205.3 with SMTP id p3mr2776929ywd.377.1518208019989; Fri,
	09 Feb 2018 12:26:59 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Fri, 09 Feb 2018 20:26:49 +0000
Message-ID: <CAFeBWL7N1D8KQxdz2AqhDHbcww8+8x8ouMKRw4rK5ubf7Z63Uw@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Weston Desktop Shell
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
X-List-Received-Date: Fri, 09 Feb 2018 20:27:01 -0000
Content-Type: multipart/alternative; boundary="001a114e3d46ba0cc90564cd598c"

--001a114e3d46ba0cc90564cd598c
Content-Type: text/plain; charset="UTF-8"

Has anyone successfully brought up Weston desktop shell on the current
master on Beagleboard X15 or AM57xx-EVM? I am having EGL initialization
error. I don't know if it is something I have mis-configured.

BR,

Adam

--001a114e3d46ba0cc90564cd598c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Has anyone successfully brought up Weston desktop shell on=
 the current master on Beagleboard X15 or AM57xx-EVM? I am having EGL initi=
alization error. I don&#39;t know if it is something I have mis-configured.=
<div><br></div><div>BR,</div><div><br></div><div>Adam</div></div>

--001a114e3d46ba0cc90564cd598c--

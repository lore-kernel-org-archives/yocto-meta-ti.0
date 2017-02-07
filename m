Return-Path: <deepakvijay2255@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2200E0083C; Mon,  6 Feb 2017 23:29:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.52 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.52 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC254E0082E
	for <meta-ti@yoctoproject.org>; Mon,  6 Feb 2017 23:29:49 -0800 (PST)
Received: by mail-wm0-f52.google.com with SMTP id v77so142128876wmv.0
	for <meta-ti@yoctoproject.org>; Mon, 06 Feb 2017 23:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=pr5PU6GtuhiS+FJ8FTUHAyrr5yPa684OUw/ICNl9afo=;
	b=Uw9Hx9o5aPn1JhhgUOUISKSOz1QPAgxur9GXq4ZnTqOs1zeEGEb+1UrXCr+NW8HVin
	t3JbUWyyohuEqV+DuCV547QX7Y4UfS7OFUnOjaHPyka3nqjIArBvPGxs66jblzNhst4T
	vQGi5/9Jg3hbecYnviARA0d1Fv5H6IDbZVTvBBzU9WBkEKV/7jSyfMpEZMiFQMdbO2Ly
	wP71sjEIZOM4CeN8XZVybOQ5NRK7Bq5u9fw6jS6ASsT//znw7wi594VTFqsAheHoSWF4
	TDxdufZfbZNkRcfb7oHVasZhyj18qGXzC6b4gOi9ZRjvfFgBN+WEoSuWEDQtsSBzVZ4+
	5MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=pr5PU6GtuhiS+FJ8FTUHAyrr5yPa684OUw/ICNl9afo=;
	b=XYwEVhd3MqwOkrbu5O8FgxLHqWxgb2UZoFDerygQQOkgOLAtIVs0dni4/6L3zWlsIc
	SSmisFdE+dmBr6bV0Q3Ufzr2oWt3E3Y+aiwEudDpoc/WN80BV9BFdLRMIWZ4vrE6wUKT
	3jXhAcb2sJt+VRkSVcvt2qeIi5YL6uT+QphBbJN18yaH+AkkmdgCljF9/i4Waho3tfha
	If6EWHr+RmqCNME/zQx/0kzikvC9+LM4xi/QDExEicICGawzUwPAdLJ5YsFPf9uTAxnP
	mPCBz8roQa1iQwPcDt5/C6jZ1prkJ9F9LPkoLAUGpQVcHa5Bs/3bzeUNVZi0clSC4WhR
	3OHw==
X-Gm-Message-State: AMke39ney70Rdq5N4ocPx/OWqLFxyU9zvnubkcGIgzOQS3RctPaW/Ulag2dNQhPhQZEsGr0jrDVR68DBKsidYQ==
X-Received: by 10.28.109.27 with SMTP id i27mr11082130wmc.54.1486452588588;
	Mon, 06 Feb 2017 23:29:48 -0800 (PST)
MIME-Version: 1.0
Sender: deepakvijay2255@gmail.com
Received: by 10.28.158.205 with HTTP; Mon, 6 Feb 2017 23:29:48 -0800 (PST)
From: deepak vijay <deepakvijay2255@rediff.com>
Date: Tue, 7 Feb 2017 12:59:48 +0530
X-Google-Sender-Auth: 71gLJvIOO2Xz-UGsfdQXQabn-Qk
Message-ID: <CAAxuRXj5GHofLCuYT118HcWixo5P4KeEtvUCdJdmXLD6qzQkng@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: How to add a new machine in meta-ti and configure ti-cgt toolchain to it?
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
X-List-Received-Date: Tue, 07 Feb 2017 07:29:50 -0000
Content-Type: multipart/alternative; boundary=001a11478e8084b8d70547ebb6d7

--001a11478e8084b8d70547ebb6d7
Content-Type: text/plain; charset=UTF-8

Hi,

I am new to Yocto. I am trying to add a new machine omapl13x to mata-ti
layer and i need to use ti-arm-cgt toolchain for this machine. But I am
getting error for do_compile showing that "/bin/armcl command not found" .

Can you guys please help me to understand where to define the toolchain
path for a particular machine?
I already tried with EXTERNAL_TOOLCHAIN in conf file but it was not
working.

-- 
Regards,
Deepak Vijay

--001a11478e8084b8d70547ebb6d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am new to Yocto. I am trying to a=
dd a new machine omapl13x to mata-ti layer and i need to use ti-arm-cgt too=
lchain for this machine. But I am getting error for do_compile showing that=
 &quot;/bin/armcl command not found&quot; .</div><div><br></div><div>Can yo=
u guys please help me to understand where to define the toolchain path for =
a particular machine?</div><div>I already tried with EXTERNAL_TOOLCHAIN in =
conf file but it was not working.=C2=A0</div><div><div><br></div>-- <br><di=
v class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr">Regards,<div>Deepak Vijay</div></div></div>
</div></div>

--001a11478e8084b8d70547ebb6d7--
